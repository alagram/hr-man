require 'rails_helper'

RSpec.describe NextOfKin, :type => :model do
  it { should belong_to(:employee) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:mobile) }
  it { should validate_numericality_of(:percentage).is_greater_than(0).is_less_than_or_equal_to(100) }
end
