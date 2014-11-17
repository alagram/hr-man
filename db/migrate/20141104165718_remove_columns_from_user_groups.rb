class RemoveColumnsFromUserGroups < ActiveRecord::Migration
  def change
    remove_column :user_groups, :dateadded, :datetime
    remove_column :user_groups, :dateupdated, :datetime

    add_column :user_groups, :created_at, :datetime
    add_column :user_groups, :updated_at, :datetime
  end
end
