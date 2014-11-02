class AddNatiionalityIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :nationality_id, :integer
  end
end
