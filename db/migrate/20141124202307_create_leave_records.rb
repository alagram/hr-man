class CreateLeaveRecords < ActiveRecord::Migration
  def change
    create_table :leave_records do |t|
      t.integer :leave_type_id
      t.string :year
      t.integer :emp_id
      t.integer :taken
      t.integer :left
      t.integer :carried_over
      t.boolean :archive
      t.boolean :isactive
      t.timestamps
    end
  end
end
