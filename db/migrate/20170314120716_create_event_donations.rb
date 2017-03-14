class CreateEventDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :event_donations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
