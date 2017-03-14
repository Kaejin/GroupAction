class AddTitleToFundraiser < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :title, :string
    add_column :fundraisers, :start_date, :date
    add_column :fundraisers, :end_date, :date
  end
end
