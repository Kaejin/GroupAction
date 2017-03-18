class CreateEventUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :event_updates do |t|
      t.references :event, foreign_key: true
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
