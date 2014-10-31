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
end
