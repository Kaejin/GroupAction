class CreateFundraiserUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :fundraiser_updates do |t|
      t.references :fundraiser, foreign_key: true
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
