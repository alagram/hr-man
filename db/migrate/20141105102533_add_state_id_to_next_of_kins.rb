class AddStateIdToNextOfKins < ActiveRecord::Migration
  def change
    add_column :next_of_kins, :state_id, :integer
  end
end
