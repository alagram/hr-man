class LeaveRequestsController < ApplicationController
  def new
    @leave_request = LeaveRequest.new
  end

  def create
    @leave_request = LeaveRequest.new(leave_request_params.merge!(employee: current_user))

    if @leave_request.save
      redirect_to new_leave_request_path
      flash[:success] = "Leave Request successfuly created."
    else
      render :new
    end
  end

  private

  def leave_request_params
    params.require(:leave_request).permit(:leave_type_id, :date_from, :date_to, :day_type, :hand_over_notes, :evidence, :relievers => [])
  end
end
