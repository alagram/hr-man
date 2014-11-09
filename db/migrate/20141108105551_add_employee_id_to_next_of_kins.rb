class AddEmployeeIdToNextOfKins < ActiveRecord::Migration
  def change
    add_column :next_of_kins, :employee_id, :integer
    remove_column :next_of_kins, :emp_id, :string
  end
end
