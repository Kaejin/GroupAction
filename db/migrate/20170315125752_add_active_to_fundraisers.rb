class AddActiveToFundraisers < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :active, :boolean, default: true
    add_column :events, :active, :boolean, default: true
  end
end
