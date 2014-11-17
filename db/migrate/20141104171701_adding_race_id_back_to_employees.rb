class AddingRaceIdBackToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :race_id, :integer
  end
end
