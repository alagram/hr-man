class EmployeesController < ApplicationController
  before_action :require_user
  before_action :set_employees, only: [:show, :edit, :update]
  before_action :require_super_user, only: :index

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

  def leave_history
    @leave_requests = current_user.leave_requests.order("date_from DESC")
  end

  def team_leave_history
    @leave_requests = LeaveRequest.select { |leave_request| leave_request if leave_request.employee.manager == current_user.manager }
  end

  def book_leave
    respond_to do |format|
      format.js do
        @leave_request = LeaveRequest.where(id: params[:leave_request], employee_id: params[:id]).first
        if @leave_request
          reliever_ids = @leave_request.relievers.reject(&:empty?)
          @relievers = Employee.where(id: reliever_ids).pluck(:email)
          @leave_request.leave_status_id = 3
          @leave_request.save
          AppMailer.send_leave_booking_email(@leave_request, @relievers).deliver
          flash.now[:success] = "Your leave is going through the approval process."
        else
          flash.now[:danger] = "Something went wrong, please check your input and try again."
        end
      end
    end
  end

  def view_leave_details
    respond_to do |format|
      format.js do
        @leave_request = LeaveRequest.where(id: params[:leave_request], employee: current_user).first
        if @leave_request
          reliever_ids = @leave_request.relievers.reject(&:empty?)
          @relievers = Employee.where(id: reliever_ids).map { |employee| [employee.first_last_name] }.join(", ")
        else
          flash.now[:danger] = "Something went wrong, please check your input and try again."
        end
      end
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
    redirect_to employees_path
  end
end
