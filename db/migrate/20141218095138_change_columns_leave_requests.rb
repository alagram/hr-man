class ChangeColumnsLeaveRequests < ActiveRecord::Migration
  def change
    rename_column :leave_requests, :left, :days_left
    rename_column :leave_requests, :taken, :days_taken
  end
end
