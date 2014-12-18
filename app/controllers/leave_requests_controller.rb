class LeaveRequestsController < ApplicationController
  def new
    @leave_request = LeaveRequest.new
  end

  def create
    if leave_request_params[:leave_type_id] == "5"
      @leave_request = LeaveRequest.new(leave_request_params.merge!(employee: current_user, leave_year: Date.today.year, date_booked: Date.today, isactive: true))
    else
      @leave_request = LeaveRequest.new(leave_request_params.merge!(employee: current_user, day_type: "full", leave_year: Date.today.year, date_booked: Date.today, isactive: true))
    end

    if @leave_request.valid?
      leave_calculator = LeavePolicyCalculator.new(leave_request_params[:date_from], leave_request_params[:num_of_days])
      return_date = leave_calculator.get_end_date(check_weekend: true, check_holiday: true)
      @leave_request.date_to = return_date
      @leave_request.save
      redirect_to new_leave_request_path
      flash[:success] = "Leave Request successfuly created. You will resume on #{return_date}."
    else
      render :new
    end
  end

  def get_end_date
    if params[:date].present? && params[:days].present?
      @leave_calculator = LeavePolicyCalculator.new(params[:date], params[:days])
      @end_date = @leave_calculator.get_end_date(check_weekend: true, check_holiday: true)
    end
    respond_to do |format|
      format.js do
        if @end_date.present?
          flash.now[:success] = "You will resume work on #{@end_date.strftime("%A %B %d, %Y")}"
        else
          flash.now[:danger] = "Please check your input and try again."
        end
      end
    end
  end

  def check_leave_bal
    respond_to do |format|
      format.js do
        sub_query = EndOfYear.where(isactive: true).select(:current_year).order(:current_year).to_sql
        if params[:leave_option].present?
          if params[:day_type] == "half"
            @leave_record = LeaveRecord.where("rec_year = (#{sub_query})
                                              and emp_id = :user_id
                                              and leave_type_id = :leave_option
                                              and days_left >= :days
                                              and isactive = :active",
                                              user_id: "#{current_user.id}",
                                              leave_option: "#{params[:leave_option]}",
                                              days: "#{params[:num_days]}".to_i / 2, active: true).first
          else
            @leave_record = LeaveRecord.where("rec_year = (#{sub_query})
                                              and emp_id = :user_id
                                              and leave_type_id = :leave_option
                                              and days_left >= :days
                                              and isactive = :active",
                                              user_id: "#{current_user.id}",
                                              leave_option: "#{params[:leave_option]}",
                                              days: "#{params[:num_days]}", active: true).first
          end
          if @leave_record.nil?
            flash.now[:danger] = "You do not have enough days to book this leave."
          end
        else
          flash.now[:danger] = "Please select leave type."
        end
      end
    end
  end

  private

  def leave_request_params
    params.require(:leave_request).permit(:leave_type_id, :date_from, :day_type, :hand_over_notes, :evidence, :num_of_days, :relievers => [])
  end
end
