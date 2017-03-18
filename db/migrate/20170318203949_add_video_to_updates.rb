class AddVideoToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :event_updates, :link, :string
    add_column :fundraiser_updates, :link, :string
  end
end
