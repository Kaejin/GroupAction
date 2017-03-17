class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.float :amount_raised, default: 0

      t.timestamps
    end
  end
end
