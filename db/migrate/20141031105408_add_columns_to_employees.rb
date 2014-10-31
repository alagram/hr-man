class AddColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :emp_id, :integer
    add_column :employees, :dept_id, :integer
    add_column :employees, :job_id, :integer
    add_column :employees, :type_id, :integer
    add_column :employees, :ssn, :string
    add_column :employees, :race, :string
    add_column :employees, :marital, :integer
    add_column :employees, :nationality, :string
    add_column :employees, :address1, :string
    add_column :employees, :address2, :string
    add_column :employees, :city_id, :string
    add_column :employees, :state, :integer
    add_column :employees, :zipcode, :integer
    add_column :employees, :country_id, :integer
    add_column :employees, :email, :string
    add_column :employees, :webpage, :string
    add_column :employees, :homephone, :string
    add_column :employees, :officephone, :string
    add_column :employees, :cellphone, :string
    add_column :employees, :regularhours, :float
    add_column :employees, :username, :string
    add_column :employees, :password_digest, :string
    add_column :employees, :usergroup_id, :integer
    add_column :employees, :numlogins, :integer
    add_column :employees, :dateadded, :datetime
    add_column :employees, :dateupdated, :datetime
    add_column :employees, :user_id, :integer
    add_column :employees, :user_ip, :integer
    add_column :employees, :manager_id, :integer
    add_column :employees, :delegated_id, :integer
    add_column :employees, :isactive, :boolean
    add_column :employees, :salaryband_id, :integer
    add_column :employees, :basesalary, :float

    remove_column :employees, :created_at, :datetime
    remove_column :employees, :updated_at, :datetime
  end
end
