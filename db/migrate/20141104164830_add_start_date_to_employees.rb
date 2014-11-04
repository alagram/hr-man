class AddStartDateToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :start_date, :datetime
  end
end
