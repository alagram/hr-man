class Emergency < ActiveRecord::Base
  belongs_to :employee

  validates_presence_of :first_name, :last_name, :mobile, :address1
  validates_format_of :mobile, :telephone, :with => /^[0-9()-]+$/, :multiline => true

  def to_s
    if other_names.present?
      "#{last_name}, #{other_names} #{first_name}"
    else
      "#{last_name}, #{first_name}"
    end
  end
end
