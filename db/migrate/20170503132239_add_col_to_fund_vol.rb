class AddColToFundVol < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :type, :string
    add_column :volunteers, :type, :string
  end
end
