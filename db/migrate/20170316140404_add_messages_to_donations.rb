class AddMessagesToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :direct_donations, :message, :string
    add_column :event_donations, :message, :string
  end
end
