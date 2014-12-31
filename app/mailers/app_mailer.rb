class AppMailer < ActionMailer::Base
  def send_leave_booking_email(leave_request, relievers)
    @leave_request = leave_request
    mail(subject: "New Leave Request", from: "info@hrapp.com", to: leave_request.employee.manager.email, cc: relievers)
  end
end
