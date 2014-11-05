class RemoveEmpIdFromNextOfKins < ActiveRecord::Migration
  def change
    remove_column :next_of_kins, :emp_id, :integer
  end
end
