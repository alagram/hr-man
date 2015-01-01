class AppMailer < ActionMailer::Base
  def send_leave_booking_email(leave_request, relievers)
    @leave_request = leave_request
    mail(subject: "New Leave Request", from: "info@hrapp.com", to: leave_request.employee.manager.email, cc: relievers)
  end

  def send_leave_approved_email(leave_request, relievers)
    @leave_request = leave_request
    mail(subject: "Leave Approved", from: "info@hrapp.com", to: leave_request.employee.email, cc: relievers)
  end
end
