class RemoveReliever1Reliever2FromLeaveRequests < ActiveRecord::Migration
  def change
    remove_column :leave_requests, :reliever1, :string
    remove_column :leave_requests, :reliever2, :string
  end
end
