class AddEmployeeImageToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_image, :string
  end
end
