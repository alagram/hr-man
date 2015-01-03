class RemoveRelieversFromLeaveRequests < ActiveRecord::Migration
  def change
    remove_column :leave_requests, :reliever_ids, :string
  end
end
