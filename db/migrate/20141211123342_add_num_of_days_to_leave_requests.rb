class AddNumOfDaysToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :num_of_days, :string
  end
end
