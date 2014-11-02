class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :dob, :gender_id
  belongs_to :gender

  def self.search(search_term)
    if search_term.include?(",")
      param = search_term.split(", ")
      where("emp_id IN (?)", param)
    else
      where(["first_name = ? or last_name = ? or other_names = ?", search_term, search_term, search_term])
    end
  end

  def full_name
    if other_names.present?
      "#{last_name}, #{other_names} #{first_name}"
    else
      "#{last_name}, #{first_name}"
    end
  end

  def self.terms_for(prefix)
    suggestions = where("first_name like :search or last_name like :search or other_names like :search or emp_id like :search", search: "%#{prefix}%")
    suggestions.limit(10).pluck(:first_name, :other_names, :last_name).map{|val| val.compact.join(" ")}
  end
end
