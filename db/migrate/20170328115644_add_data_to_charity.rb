class AddDataToCharity < ActiveRecord::Migration[5.0]
  def change
    add_column :charities, :mission, :string
    add_column :charities, :bio, :string
    add_column :charities, :charity_number, :string
  end
end
