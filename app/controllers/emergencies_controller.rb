class EmergenciesController < ApplicationController
  before_action :find_employee
  before_action :find_emergency, only: [:edit, :update]

  def new
    @emergency = Emergency.new
  end

  def create
    @emergency = Emergency.new(emergency_params)
    @emergency.employee_id = @employee.id

    if @emergency.save
      redirect_to employee_path(@employee, tab: 'emergency')
      flash[:success] = "Record Successfully added"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @emergency.update(emergency_params)
      redirect_to employee_path(@employee, tab: 'emergency')
      flash[:success] = "Record Successfully updated"
    else
      render :edit
    end
  end


  private

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  def find_emergency
    @emergency = Emergency.find(params[:id])
  end

  def emergency_params
    params.require(:emergency).permit(:title, :first_name, :last_name, :other_names, :telephone, :mobile, :address1, :address2, :city_id, :state_id, :postcode)
  end
end
