class RenameRaceToRaceId < ActiveRecord::Migration
  def change
    rename_column :employees, :race, :race_id
  end
end
