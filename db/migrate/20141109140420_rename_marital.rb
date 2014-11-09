class RenameMarital < ActiveRecord::Migration
  def change
    rename_column :employees, :marital, :marital_id
  end
end
