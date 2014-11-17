class RenameStateToStateId < ActiveRecord::Migration
  def change
    rename_column :employees, :state, :state_id
  end
end
