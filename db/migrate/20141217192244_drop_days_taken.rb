class DropDaysTaken < ActiveRecord::Migration
  def change
    remove_column :leave_records, :days_taken
  end
end
