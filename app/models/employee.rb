class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :dob, :gender_id
  belongs_to :gender
  has_secure_password validations: false
  has_many :emergencies, foreign_key: 'emp_id', primary_key: 'emp_id'
  has_one :next_of_kin, foreign_key: 'emp_id', primary_key: 'emp_id'

  def self.search(search_term)
    if search_term.include?(",")
      param = search_term.split(",").map(&:strip).map(&:downcase)
      where("lower(emp_id) IN (?)", param)
    else
      find_by_sql("SELECT * from employees WHERE concat(first_name, other_names, last_name) = '#{search_term.split.join}'")
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
end
