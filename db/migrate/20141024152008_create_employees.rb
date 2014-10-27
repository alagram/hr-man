class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :other_names
      t.string :dob
      t.integer :gender

      t.timestamps
    end
  end
end
