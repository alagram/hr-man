class Admin::EmployeesController < ApplicationController

  before_action :require_user
  before_action :set_employees, only: [:edit, :update]
  before_action :require_super_user

  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.includes(:gender)
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
      flash[:success] = "Employee successfully created."
    else
      render :new
    end
  end

  def edit;end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
      flash[:success] = "Employee successfully updated."
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :other_names, :emp_id, :dob, :gender_id, :user_group_id, :username, :password, :dept_id, :job_title_id, :type_id, :ssn, :race_id, :marital_id, :nationality_id,
                                    :manager_name, :address1, :address2, :city_id, :state_id, :zipcode, :country_id, :email, :webpage, :homephone, :officephone, :cellphone, :regularhours, :basesalary, :start_date, :employee_image)
  end

  def set_employees
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "The employee you're looking for could not be found."
    redirect_to admin_employees_path
  end
end
