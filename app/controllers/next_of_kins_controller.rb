class NextOfKinsController < ApplicationController
  def create
    @employee = Employee.find(params[:employee_id])
    @next_of_kin = NextOfKin.new(next_of_kin_params)
    @next_of_kin.emp_id = @employee.emp_id


    if @next_of_kin.save
      redirect_to :back
    else
      render "employees/show"
    end
  end

  def edit; end

  private

  def next_of_kin_params
    params.require(:next_of_kin).permit(:title, :first_name, :last_name, :telephone, :mobile, :address1, :address2, :city_id, :postcode, :relationship, :percentage)
  end
end
