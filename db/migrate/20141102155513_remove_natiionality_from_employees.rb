class RemoveNatiionalityFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :nationality, :string
  end
end
