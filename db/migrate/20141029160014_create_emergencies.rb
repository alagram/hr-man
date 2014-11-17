class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.integer :emp_id
      t.string :title
      t.string :title
      t.string :first_name
      t.string :other_names
      t.string :last_name
      t.string :telephone
      t.string :mobile
      t.string :address1
      t.string :address2
      t.integer :city
      t.integer :state
      t.string :postcode
      t.datetime :dateadded
      t.datetime :dateupdated
      t.integer :user_id
      t.string :user_ip
      t.boolean :isactive
    end
  end
end
