require "rails_helper"

RSpec.describe UserGroup, :type => :model do
  it { should have_many(:employees) }
end
