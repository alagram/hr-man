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

  def search
    binding.pry
    @employee = Employee.find(params[:q])
    @results = Employee.search(params[:q])
  end

  def search_suggestions
    render json: Employee.terms_for(params[:term])
  end


  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :other_names, :dob, :gender_id)
  end

  def set_employees
    @employee = Employee.find(params[:id])
  end

  def sort_column
    Employee.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
