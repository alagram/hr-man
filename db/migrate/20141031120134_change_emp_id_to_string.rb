class ChangeEmpIdToString < ActiveRecord::Migration
  def change
    change_column :employees, :emp_id, :string
  end
end
