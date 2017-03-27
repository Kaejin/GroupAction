class CreateOfflineDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :offline_donations do |t|
      t.float :amount
      t.string :message
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
