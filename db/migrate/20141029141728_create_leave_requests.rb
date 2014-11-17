class CreateLeaveRequests < ActiveRecord::Migration
  def change
    create_table :leave_requests do |t|
      t.integer :emp_id
      t.string :balance_year
      t.string :taken
      t.string :left
      t.string :approver
      t.text :handovernotes
      t.string :reliever1
      t.string :reliever2
      t.integer :leavetype
      t.string :daytype
      t.datetime :datefrom
      t.datetime :dateto
      t.datetime :datebooked
      t.datetime :dateapproved
      t.boolean :status
      t.boolean :isactive
    end
  end
end
