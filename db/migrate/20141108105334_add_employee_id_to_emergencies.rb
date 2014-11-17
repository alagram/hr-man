class AddEmployeeIdToEmergencies < ActiveRecord::Migration
  def change
    add_column :emergencies, :employee_id, :integer
    remove_column :emergencies, :emp_id, :string
  end
end
