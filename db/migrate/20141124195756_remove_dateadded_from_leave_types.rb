class RemoveDateaddedFromLeaveTypes < ActiveRecord::Migration
  def change
    remove_column :leave_types, :dateadded, :datetime
    remove_column :leave_types, :dateupdated, :datetime

    add_column :leave_types, :created_at, :datetime
    add_column :leave_types, :updated_at, :datetime
  end
end
