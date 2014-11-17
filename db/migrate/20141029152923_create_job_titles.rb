class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.integer :emp_id
      t.integer :company_id
      t.string :name
      t.text :desc
      t.text :responsibilities
      t.datetime :dateadded
      t.datetime :dateupdated
      t.integer :user_id
      t.string :user_ip
      t.boolean :isactive
    end
  end
end
