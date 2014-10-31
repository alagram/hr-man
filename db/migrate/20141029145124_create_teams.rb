class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :company_id
      t.integer :dept_id
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
