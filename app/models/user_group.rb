class UserGroup < ActiveRecord::Base
  has_many :employees
end
