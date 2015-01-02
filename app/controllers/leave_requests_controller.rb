class LeaveRequestsController < ApplicationController
  def new
    @leave_request = LeaveRequest.new
    @leave_records = current_user.leave_records
  end

  def create
    if leave_request_params[:leave_type_id] == "5" && leave_request_params[:day_type] == "half"
      @leave_request = LeaveRequest.new(leave_request_params.merge!(leave_status_id: 1, employee: current_user,
                                        leave_year: Date.today.year, date_booked: Date.today,
                                        isactive: true,
                                        days_taken: leave_request_params[:num_of_days].to_i / 2.to_f,
                                        num_of_days: leave_request_params[:num_of_days].to_i / 2.to_f))
    else
      @leave_request = LeaveRequest.new(leave_request_params.merge!(leave_status_id: 1, employee: current_user,
                                        day_type: "full", leave_year: Date.today.year,
                                        date_booked: Date.today, isactive: true,
                                        num_of_days: leave_request_params[:num_of_days],
                                        days_taken: leave_request_params[:num_of_days]))
    end

    if @leave_request.valid?
      leave_bal = check_bookable_balance(leave_request_params[:leave_type_id], leave_request_params[:num_of_days].to_i)
      entitlement = LeaveType.select(:entitlement).where(id: leave_request_params[:leave_type_id]).to_sql

      if LeaveRecord.connection.update("UPDATE leave_records set days_left = days_left - #{leave_request_params[:num_of_days].to_i},
                            days_taken = days_taken + #{leave_request_params[:num_of_days].to_i} WHERE employee_id = #{current_user.id}
                            and (days_left + days_taken) = (#{entitlement})
                            and (days_left - #{leave_request_params[:num_of_days].to_i}) >= 0") && leave_bal
        leave_calculator = LeavePolicyCalculator.new(leave_request_params[:date_from],
                                                    leave_request_params[:num_of_days])
        return_date = leave_calculator.get_end_date(check_weekend: true, check_holiday: true)
        @leave_request.date_to = return_date
        @leave_request.days_left = LeaveRecord.where(employee_id: current_user.id, leave_type_id: leave_request_params[:leave_type_id]).first.days_left
        @leave_request.save
        redirect_to new_leave_request_path
        flash[:success] = "Leave Request successfuly created. You will resume on #{return_date.strftime("%A %B %d, %Y")}."
      else
        flash.now[:danger] = "Please check your inputs."
        render :new
      end
    else
      @leave_records = current_user.leave_records
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
        @max_bookable = LeaveType.find(params[:leave_option])

        if params[:leave_option].present?
          if params[:day_type] == "half"
            @leave_record = check_bookable_balance(params[:leave_option], params[:num_days].to_i / 2.to_f)
          else
            @leave_record = check_bookable_balance(params[:leave_option], params[:num_days].to_i)
          end
          if @leave_record.nil?
            flash.now[:danger] = "You do not have enough days to book this leave."
          end
        else
          flash.now[:danger] = "Please select leave type."
        end

        if params[:day_type] == "half"
          if params[:num_days].to_f / 2 > @max_bookable.max_days && @leave_record
            flash.now[:danger] = "The maximum days you can book is #{@max_bookable.max_days} days."
          end
        else
          if params[:num_days].to_f > @max_bookable.max_days && @leave_record
            flash.now[:danger] = "The maximum days you can book is #{@max_bookable.max_days} days."
          end
        end
      end
    end
  end

  def confirm_leave_days
    respond_to do |format|
      format.js do
        @record = ActiveRecord::Base.connection.execute("SELECT t.id, t.name, t.bookable_by,
                                      t.max_days, t.entitlement, r.rec_year,
                                      r.employee_id, r.days_left, r.days_taken
                                      FROM leave_records AS r
                                      LEFT JOIN leave_types as t
                                      ON r.leave_type_id = t.id
                                      where
                                      r.rec_year = (select current_year from end_of_years where isactive = true)
                                      and r.employee_id = #{current_user.id}
                                      and r.leave_type_id = #{params[:leave_type]}").to_a.first

        if @record["days_left"].to_i == 0
          flash.now[:danger] = "You do not have enough days to book this leave."
        end
      end
    end
  end

  def leave_history
    @leave_requests = current_user.leave_requests.order("date_from DESC")
  end

  def book_leave
    respond_to do |format|
      format.js do
        @leave_request = LeaveRequest.where(id: params[:leave_request], employee: current_user).first
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

  def team_leave_history
    @leave_requests = LeaveRequest.order("date_from DESC").select { |leave_request| leave_request if leave_request.employee.manager == current_user.manager }

    if current_user && super_user?
      @leave_requests = LeaveRequest.order("date_from DESC").select { |leave_request| leave_request if leave_request.employee.manager_id == current_user.id }
    end
  end

  def show
    respond_to do |format|
      format.js do
        @leave_request = LeaveRequest.find(params[:id])
        if @leave_request
          reliever_ids = @leave_request.relievers.reject(&:empty?)
          @relievers = Employee.where(id: reliever_ids).map { |employee| [employee.first_last_name] }.join(", ")
        else
          flash.now[:danger] = "Something went wrong, please check your input and try again."
        end
      end
    end
  end

  def pending_requests
    @pending_requests = LeaveRequest.where(leave_status_id: 3).select { |leave_request| leave_request if leave_request.employee.manager_id == current_user.id }
  end

  def approve_leave
    respond_to do |format|
      format.js do
        @leave_request = LeaveRequest.find(params[:leave_request])

        if @leave_request
          reliever_ids = @leave_request.relievers.reject(&:empty?)
          @relievers = Employee.where(id: reliever_ids).pluck(:email)
          @leave_request.leave_status_id = 4
          @leave_request.approver = current_user.first_last_name
          @leave_request.date_approved = Date.today
          @leave_request.save if @leave_request.employee.manager == current_user
          AppMailer.send_leave_approved_email(@leave_request, @relievers).deliver
          flash.now[:success] = "Leave Request successfully approved."
        else
          flash.now[:danger] = "Something went wrong, please check your input and try again."
        end
      end
    end
  end

  private

  def leave_request_params
    params.require(:leave_request).permit(:leave_type_id, :date_from,
                  :day_type, :hand_over_notes, :evidence,
                  :num_of_days, :relievers => [])
  end

  def check_bookable_balance(leave_type, num_days)
    sub_query = EndOfYear.where(isactive: true).select(:current_year).order(:current_year).to_sql
    LeaveRecord.where("rec_year = (#{sub_query})
                      and employee_id = :user_id
                      and leave_type_id = :leave_option
                      and days_left >= :days
                      and isactive = :active",
                      user_id: "#{current_user.id}",
                      leave_option: "#{leave_type}",
                      days: "#{num_days}", active: true).first
  end
end
