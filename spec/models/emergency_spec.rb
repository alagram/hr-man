require "rails_helper"

RSpec.describe Emergency, :type => :model do
  it { should belong_to :employee }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:mobile) }
  it { should validate_presence_of(:address1) }
end
