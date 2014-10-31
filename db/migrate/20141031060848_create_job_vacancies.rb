class CreateJobVacancies < ActiveRecord::Migration
  def change
    create_table :job_vacancies do |t|
      t.integer :company_id
      t.integer :job_title_id
      t.integer :division_id
      t.integer :department_id
      t.integer :location_id
      t.integer :currency_id
      t.float :salary
      t.integer :grade
      t.float :hours
      t.integer :contract_type
      t.string :reporting_to
      t.text :addtional_info
      t.text :company_profile
      t.text :job_summary
      t.text :responsibilities
      t.text :selection_criteria
      t.text :desirable
      t.text :how_to_apply
      t.datetime :dateadded
      t.datetime :dateupdated
      t.integer :user_id
      t.string :user_ip
      t.boolean :isactive
    end
  end
end
