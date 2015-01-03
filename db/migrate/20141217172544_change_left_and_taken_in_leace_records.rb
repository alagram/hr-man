class ChangeLeftAndTakenInLeaceRecords < ActiveRecord::Migration
  def change
    rename_column :leave_records, :taken, :days_taken
    rename_column :leave_records, :left, :days_left
  end
end
