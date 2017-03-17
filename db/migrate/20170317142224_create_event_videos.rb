class CreateEventVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :event_videos do |t|
      t.references :event, foreign_key: true
      t.string :link
      t.string :title
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
