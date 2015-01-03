class AddEvidenceToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :evidence, :string
  end
end
