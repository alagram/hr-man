class AddRelieversToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :relievers, :string, array: true
  end
end
