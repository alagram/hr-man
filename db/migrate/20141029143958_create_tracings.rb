class CreateTracings < ActiveRecord::Migration
  def change
    create_table :tracings do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :user_ip
      t.string :action
      t.integer :record_id
      t.datetime :event_date
    end
  end
end
