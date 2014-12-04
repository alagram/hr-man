class AddRelieverIdsToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :relievers, :string, array: true, default: []
  end
end
