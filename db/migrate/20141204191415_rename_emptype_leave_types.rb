class RenameEmptypeLeaveTypes < ActiveRecord::Migration
  def change
    rename_column :leave_types, :emptype, :emp_type
  end
end
