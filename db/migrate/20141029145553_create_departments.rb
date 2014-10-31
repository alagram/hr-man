class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :company_id
      t.string :name
      t.integer :manager_id
      t.datetime :dateadded
      t.datetime :dateupdated
      t.integer :user_id
      t.string :user_ip
      t.boolean :isactive
    end
  end
end
