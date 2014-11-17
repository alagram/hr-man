class ChangeEmergenciesEmpIdToInteger < ActiveRecord::Migration
  def change
    change_column :emergencies, :emp_id, :string
  end
end
