class AddColToFundraiserBecauseArchieIsAGoon < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisers, :target, :float
    add_column :fundraisers, :amount_raised, :float, default: 0
  end
end
