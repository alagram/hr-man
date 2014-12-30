class LeaveRecord < ActiveRecord::Base
  belongs_to :leave_type
  belongs_to :employee
end
