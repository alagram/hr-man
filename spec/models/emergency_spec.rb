require "rails_helper"

RSpec.describe Emergency, :type => :model do
  it { should belong_to :employee }
end
