class AddDefaultValueToDaysPerMonth < ActiveRecord::Migration
  def change
    remove_column :leave_types, :dayspermonth, :float
    add_column :leave_types, :days_per_month, :float, default: 0
  end
end
