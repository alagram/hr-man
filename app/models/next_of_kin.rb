class NextOfKin < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :first_name, :last_name, :mobile
  validates_numericality_of :percentage, greater_than: 0, less_than_or_equal_to: 100
  validates_format_of :mobile, :telephone, :with => /^[0-9()-]+$/, :multiline => true

  def to_s
    if other_names.present?
      "#{last_name}, #{other_names} #{first_name}"
    else
      "#{last_name}, #{first_name}"
    end
  end
end
