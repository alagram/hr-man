class RenameLeaveYearInLeaveRequests < ActiveRecord::Migration
  def change
    rename_column :leave_requests, :leve_year, :leave_year
  end
end
