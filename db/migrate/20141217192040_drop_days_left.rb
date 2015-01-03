class DropDaysLeft < ActiveRecord::Migration
  def change
    remove_column :leave_records, :days_left
  end
end
