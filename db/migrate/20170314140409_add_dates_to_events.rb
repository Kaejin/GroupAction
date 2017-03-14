class AddDatesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :start_datetime, :datetime
    add_column :events, :end_datetime, :datetime
  end
end
