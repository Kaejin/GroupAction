class AddColToFundVol < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :goal, :string
    add_column :volunteers, :goal, :string
  end
end
