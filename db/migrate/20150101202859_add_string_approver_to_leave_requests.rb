class AddStringApproverToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :approver, :string
  end
end
