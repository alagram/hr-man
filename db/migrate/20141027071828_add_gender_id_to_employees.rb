class AddGenderIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :gender_id, :integer
  end
end
