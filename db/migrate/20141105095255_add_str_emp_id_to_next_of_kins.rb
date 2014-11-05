class AddStrEmpIdToNextOfKins < ActiveRecord::Migration
  def change
    add_column :next_of_kins, :emp_id, :string
  end
end
