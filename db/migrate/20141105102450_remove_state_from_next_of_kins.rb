class RemoveStateFromNextOfKins < ActiveRecord::Migration
  def change
    remove_column :next_of_kins, :state, :string
  end
end
