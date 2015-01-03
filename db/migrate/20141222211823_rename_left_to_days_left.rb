class RenameLeftToDaysLeft < ActiveRecord::Migration
  def change
    rename_column :leave_types, :max, :max_days
  end
end
