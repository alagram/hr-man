class NextOfKinsController < ApplicationController
  before_action :find_employee
  before_action :find_next_of_kin, only: [:edit, :update]
  before_action :find_next_of_kins_percentage, only: :new
  # before_action :check_percentage_value, only: :create

  def new
    @next_of_kin = NextOfKin.new
  end

  def create
    @next_of_kin = NextOfKin.new(next_of_kin_params)
    @next_of_kin.employee_id = @employee.id
    current_percentage = @employee.next_of_kins.sum(:percentage)

    if next_of_kin_params["percentage"].to_f + current_percentage > 100
      redirect_to new_employee_next_of_kin_path
      flash[:danger] = "Please reduce percentage value."
    elsif @next_of_kin.save
      redirect_to @employee
      flash[:success] = "Next of Kin successfully added."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @next_of_kin.update(next_of_kin_params)
      redirect_to @employee
      flash[:success] = "Record successfully updated"
    else
      render :edit
    end
  end

  private

  def next_of_kin_params
    params.require(:next_of_kin).permit(:title, :first_name, :last_name, :other_names, :state_id, :telephone, :mobile, :address1, :address2, :city_id, :postcode, :relationship, :percentage)
  end

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  def find_next_of_kin
    @next_of_kin = NextOfKin.find(params[:id])
  end

  def find_next_of_kins_percentage
    if @employee.next_of_kins.sum(:percentage) == 100
      redirect_to @employee
      flash[:danger] = "Please adjust next of kin percentage for employee before adding new."
    end
  end

  def check_percentage_value
    current_percentage = @employee.next_of_kins.sum(:percentage)
    if params[:percentage].to_f + current_percentage > 100
      redirect_to new_employee_next_of_kin_path
      flash[:danger] = "Please reduce percentage value."
    end
  end
end
