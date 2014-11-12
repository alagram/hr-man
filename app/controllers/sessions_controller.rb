class SessionsController < ApplicationController
  def new
    redirect_to employees_path if current_user
  end

  def create
    employee = Employee.where(emp_id: params[:emp_id]).first

    if employee && employee.authenticate(params[:password])
      session[:emp_id] = employee.id
      redirect_to employees_path
      flash[:success] = "You have successfully signed in."
    else
      flash[:danger] = "Invalid credentials."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:emp_id] = nil
    redirect_to sign_in_path
    flash[:info] = "Signed out successfully"
  end
end
