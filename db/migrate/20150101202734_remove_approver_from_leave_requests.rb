class RemoveApproverFromLeaveRequests < ActiveRecord::Migration
  def change
    remove_column :leave_requests, :approver
  end
end
