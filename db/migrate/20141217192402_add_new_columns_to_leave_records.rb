class AddNewColumnsToLeaveRecords < ActiveRecord::Migration
  def change
    add_column :leave_records, :days_left, :float
    add_column :leave_records, :days_taken, :float
  end
end
