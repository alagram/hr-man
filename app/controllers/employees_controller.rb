class EmployeesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_employees, only: [:show, :edit, :update]

  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.includes(:gender)
  end

  def create
    binding.pry
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
      flash[:success] = "Employee successfully created."
    else
      render :new
    end
  end

  def edit;end

  def show; end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
      flash[:success] = "Employee successfully updated."
    else
      render :edit
    end
  end

  def search
    @results = Employee.includes(:gender).search(params[:q])
  end

  def search_suggestions
    render json: Employee.terms_for(params[:term])
  end

  def employee_managers
    query = Employee.where("user_group_id in (1, 2) and lower(first_name) like :param or
                          lower(last_name) like :param", param: "%#{params[:term].downcase}%")
    @managers = query.limit(10).pluck(:first_name, :last_name).map{ |name| name.join(" ") }
    render json: @managers
  end


  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :other_names, :emp_id, :dob, :gender_id, :user_group_id, :username, :password, :dept_id, :job_title_id, :type_id, :ssn, :race_id, :marital_id, :nationality_id,
                                    :manager_name, :address1, :address2, :city_id, :state_id, :zipcode, :country_id, :email, :webpage, :homephone, :officephone, :cellphone, :regularhours, :basesalary, :start_date)
  end

  def set_employees
    @employee = Employee.find(params[:id])
  end
end
