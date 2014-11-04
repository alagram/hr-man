class RemoveRaceIdFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :race_id, :string
  end
end
