class ChangesToLeaveRequests < ActiveRecord::Migration
  def change
    remove_column :leave_requests, :balance_year
    remove_column :leave_requests, :taken
    remove_column :leave_requests, :left
    remove_column :leave_requests, :approver
    remove_column :leave_requests, :reliever1
    remove_column :leave_requests, :reliever2
    remove_column :leave_requests, :daytype
    remove_column :leave_requests, :leavetype
    remove_column :leave_requests, :datebooked
    remove_column :leave_requests, :dateapproved
    remove_column :leave_requests, :status
    remove_column :leave_requests, :handovernotes
    remove_column :leave_requests, :datefrom
    remove_column :leave_requests, :dateto

    add_column :leave_requests, :leve_year, :integer
    add_column :leave_requests, :date_from, :datetime
    add_column :leave_requests, :date_to, :datetime
    add_column :leave_requests, :taken, :float
    add_column :leave_requests, :left, :float
    add_column :leave_requests, :approver, :integer
    add_column :leave_requests, :reliever1, :integer
    add_column :leave_requests, :reliever2, :integer
    add_column :leave_requests, :day_type, :string
    add_column :leave_requests, :leave_type_id, :integer
    add_column :leave_requests, :date_booked, :datetime
    add_column :leave_requests, :date_approved, :datetime
    add_column :leave_requests, :hand_over_notes, :text
    add_column :leave_requests, :leave_statuses_id, :integer
  end
end
