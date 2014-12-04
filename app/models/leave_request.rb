class LeaveRequest < ActiveRecord::Base
  mount_uploader :evidence, LeaveRequestUploader
  belongs_to :employee
  validates_presence_of :hand_over_notes, :relievers, :day_type, :date_to, :date_from
  validates :leave_type_id, numericality: { only_integer: true }
  # has_many :relievers, class_name: "Employee", foreign_key: :employee_id
end
