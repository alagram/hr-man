class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :dob, :gender_id
  belongs_to :gender
end
