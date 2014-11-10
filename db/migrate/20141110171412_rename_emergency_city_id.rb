class RenameEmergencyCityId < ActiveRecord::Migration
  def change
    rename_column :emergencies, :city, :city_id
    rename_column :emergencies, :state, :state_id
  end
end
