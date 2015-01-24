class EmployeesController < ApplicationController
  before_action :require_user
  before_action :set_employees, only: [:show]

  def show; end

  def search
    @results = Employee.includes(:gender).search(params[:q])

    if @results.size == 1
      redirect_to employee_path(@results.first.id)
    else
      @results
    end

  end

  def search_suggestions
    render json: Employee.terms_for(params[:term])
  end

  def employee_managers
    query = Employee.where("user_group_id in (1, 2) and (lower(first_name) like :param or
                          lower(last_name) like :param)", param: "%#{params[:term].downcase}%").limit(10)
    @managers = query.pluck(:first_name, :last_name).map{ |name| name.join(" ") }
    render json: @managers
  end

  private

  def set_employees
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "The employee you're looking for could not be found."
    redirect_to employees_path
  end
end
