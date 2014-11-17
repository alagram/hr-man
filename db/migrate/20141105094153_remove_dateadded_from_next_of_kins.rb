class RemoveDateaddedFromNextOfKins < ActiveRecord::Migration
  def change
    remove_column :next_of_kins, :dateadded, :datetime
    remove_column :next_of_kins, :dateupdated, :datetime

    add_column :next_of_kins, :created_at, :datetime
    add_column :next_of_kins, :updated_at, :datetime
  end
end
