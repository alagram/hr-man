require 'rails_helper'

RSpec.describe Employee, :type => :model do
 it { should belong_to(:gender) }
 it { should validate_presence_of(:first_name) }
 it { should validate_presence_of(:last_name) }
 it { should validate_presence_of(:dob) }
 it { should validate_presence_of(:gender_id) }
 it { should have_many(:emergencies) }
 it { should have_many(:next_of_kins) }
 it { should belong_to(:user_group) }
 it { should validate_presence_of(:manager_id) }
 it { should validate_uniqueness_of(:emp_id) }
 it { should belong_to(:job_title) }
 it { should belong_to(:nationality) }

  describe "search" do

    let(:manager) { Fabricate(:employee, manager_id: 1) }

    it "returns an array if one record is found" do
      jane = Fabricate(:employee, emp_id: "E1", first_name: "Jane", last_name: "Smith", other_names: "Abena", manager: manager)
      bob = Fabricate(:employee, emp_id: "E2", first_name: "Bob", last_name: "Doe", manager: manager)
      expect(Employee.search("Jane Abena Smith")).to eq([jane])
    end
    it "returns an array if search for emp id is separated by commas" do
      jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena", manager: manager)
      bob = Fabricate(:employee, emp_id: "emp_2", first_name: "Bob", last_name: "Doe", manager: manager)
      alice = Fabricate(:employee, emp_id: "emp_3", first_name: "Alice", last_name: "Agram", other_names: "Ama", manager: manager)
      expect(Employee.search("emp_1, emp_2, emp_3")).to eq([jane, bob, alice])
    end
    it "returns an empty array when no record is found" do
      jane = Fabricate(:employee, emp_id: "E1", first_name: "Jane", last_name: "Smith", other_names: "Abena", manager: manager)
      bob = Fabricate(:employee, emp_id: "E2", first_name: "Bob", last_name: "Doe", manager: manager)
      expect(Employee.search("William")).to eq([])
    end
    it "retruns an array of one employee for a partial search" do
      jane = Fabricate(:employee, emp_id: "E1", first_name: "Jane", last_name: "Smith", other_names: "Abena", manager: manager)
      expect(Employee.search("ane")).to eq([jane])
    end
    it "returns an empty array for a search with an empty string" do
      jane = Fabricate(:employee, emp_id: "E1", first_name: "Jane", last_name: "Smith", other_names: "Abena", manager: manager)
      expect(Employee.search("")).to eq([])
    end
 end
end
