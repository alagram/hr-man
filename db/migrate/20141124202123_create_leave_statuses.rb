class CreateLeaveStatuses < ActiveRecord::Migration
  def change
    create_table :leave_statuses do |t|
      t.string :name
      t.boolean :isactive
      t.timestamps
    end
  end
end
