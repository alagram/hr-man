class RenameEmpIdLeaveRequests < ActiveRecord::Migration
  def change
    rename_column :leave_requests, :emp_id, :employee_id
  end
end
