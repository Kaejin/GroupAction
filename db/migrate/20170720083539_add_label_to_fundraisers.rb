class AddLabelToFundraisers < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :label, :string
  end
end
