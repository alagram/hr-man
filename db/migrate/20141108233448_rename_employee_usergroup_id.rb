class RenameEmployeeUsergroupId < ActiveRecord::Migration
  def change
    rename_column :employees, :usergroup_id, :user_group_id
  end
end
