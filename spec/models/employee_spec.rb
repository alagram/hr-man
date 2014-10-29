require 'rails_helper'

RSpec.describe Employee, :type => :model do
 it { should belong_to(:gender) }
 it { should validate_presence_of(:first_name) }
 it { should validate_presence_of(:last_name) }
 it { should validate_presence_of(:dob) }
 it { should validate_presence_of(:gender_id) }
end
