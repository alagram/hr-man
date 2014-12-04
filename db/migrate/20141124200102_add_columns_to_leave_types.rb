class AddColumnsToLeaveTypes < ActiveRecord::Migration
  def change
    add_column :leave_types, :gender_id, :integer
    add_column :leave_types, :option, :string
    add_column :leave_types, :entitlement, :integer
    add_column :leave_types, :max, :integer
    add_column :leave_types, :carry_forward, :boolean
    add_column :leave_types, :bookable_by, :string
    add_column :leave_types, :service_period_limitation, :integer
    add_column :leave_types, :weekend, :boolean, default: false
  end
end
