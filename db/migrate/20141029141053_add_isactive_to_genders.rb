class AddIsactiveToGenders < ActiveRecord::Migration
  def change
    add_column :genders, :isactive, :boolean
  end
end
