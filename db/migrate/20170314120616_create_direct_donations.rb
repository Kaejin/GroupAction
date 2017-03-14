class CreateDirectDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :direct_donations do |t|
      t.float :amount
      t.references :user, foreign_key: true
      t.references :fundraising_event, foreign_key: true

      t.timestamps
    end
  end
end
