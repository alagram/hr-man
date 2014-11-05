require 'rails_helper'

RSpec.describe NextOfKin, :type => :model do
  it { should belong_to(:employee).with_foreign_key(:emp_id) }
end
