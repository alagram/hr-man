class RenameEmpIdLeaveRecrods < ActiveRecord::Migration
  def change
    rename_column :leave_records, :emp_id, :employee_id
  end
end
