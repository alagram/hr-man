class RemoveGenderFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :gender, :string
  end
end
