class NextOfKin < ActiveRecord::Base
  belongs_to :employee, foreign_key: 'emp_id', primary_key: 'emp_id'

  def to_s
    if other_names.present?
      "#{last_name}, #{other_names} #{first_name}"
    else
      "#{last_name}, #{first_name}"
    end
  end
end
