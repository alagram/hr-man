class LeaveRequest < ActiveRecord::Base
  mount_uploader :evidence, LeaveRequestUploader
  belongs_to :employee
  validates_presence_of :hand_over_notes, :relievers, :date_from, :num_of_days
  validates_numericality_of :num_of_days, greater_than: 0
  validates :leave_type_id, numericality: { only_integer: true }
  # has_many :relievers, class_name: "Employee", foreign_key: :employee_id
  validate :past_date
  validate :date_is_holiday
  belongs_to :leave_type
  belongs_to :leave_status


  def past_date
    if (date_from.present? && date_from < Date.today)
      errors[:base] << "Date cannot be in the past."
    end
  end

  def date_is_holiday
    if date_from.present?
      unless Holiday.where("hol_date = ?", Date.parse(date_from.to_s)).empty?
        errors[:base] << "The Date you've selected is a holiday. Please check your input."
      end
    end
  end
end
