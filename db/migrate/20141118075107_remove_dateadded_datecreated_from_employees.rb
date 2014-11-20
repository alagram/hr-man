class RemoveDateaddedDatecreatedFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :dateadded, :datetime
    remove_column :employees, :dateupdated, :datetime
  end
end
