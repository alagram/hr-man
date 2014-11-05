class RenameCityInNextOfKins < ActiveRecord::Migration
  def change
    rename_column :next_of_kins, :city, :city_id
  end
end
