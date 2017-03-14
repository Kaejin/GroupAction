class AddisCharityToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_charity, :boolean, default: :false
  end
end
