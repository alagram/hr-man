class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :dob, :gender_id, :manager_id
  validates_format_of :cellphone, :officephone, :with => /^[0-9()-]+$/, :multiline => true
  validates_format_of :email, :with => /@/
  validates_uniqueness_of :emp_id

  mount_uploader :employee_image, EmployeeImageUploader

  belongs_to :gender
  has_secure_password validations: false
  has_many :emergencies
  has_many :next_of_kins
  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :user_group
  belongs_to :job_title
  belongs_to :nationality
  belongs_to :ethnicity, class_name: "Race", foreign_key: "race_id"
  belongs_to :department
  belongs_to :marital
  belongs_to :type
  has_many :leave_requests
  has_many :leave_records

  def self.search(search_term)
    return [] if search_term.blank?
    if search_term.include?(",")
      param = search_term.split(",").map(&:strip).map(&:downcase)
      where("lower(emp_id) IN (?)", param)
    else
      find_by_sql("SELECT * from employees WHERE concat(lower(first_name), lower(other_names), lower(last_name)) like '%#{search_term.split.join.downcase}%'")
    end
  end

  def to_s
    if other_names.present?
      "#{last_name}, #{other_names} #{first_name}"
    else
      "#{last_name}, #{first_name}"
    end
  end

  def self.terms_for(prefix)
    suggestions = where("lower(first_name) like :search or lower(last_name) like :search or lower(other_names) like :search or lower(emp_id) like :search", search: "%#{prefix.downcase}%")
    suggestions.limit(10).pluck(:first_name, :other_names, :last_name).map{|val| val.compact.join(" ")}
  end

  def manager_name
    "#{manager.first_name} #{manager.last_name}" if manager.present?
  end

  def manager_name=(name)
    names = name.split(" ")
    self.manager = Employee.find_by_first_name_and_last_name(names.first, names.last) if name.present?
  end

  def first_last_name
    "#{first_name} #{last_name}"
  end
end
