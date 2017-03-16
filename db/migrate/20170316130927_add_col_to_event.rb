class AddColToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :amount_raised, :float, default: 0
    add_column :events, :target, :float
  end
end
