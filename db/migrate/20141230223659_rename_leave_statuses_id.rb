class RenameLeaveStatusesId < ActiveRecord::Migration
  def change
    rename_column :leave_requests, :leave_statuses_id, :leave_status_id
  end
end
