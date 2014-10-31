require 'rails_helper'

RSpec.describe Employee, :type => :model do
 it { should belong_to(:gender) }
 it { should validate_presence_of(:first_name) }
 it { should validate_presence_of(:last_name) }
 it { should validate_presence_of(:dob) }
 it { should validate_presence_of(:gender_id) }

 describe "search" do
  it "returns an array if one record is found" do
    jane = Fabricate(:employee, emp_id: 1, first_name: "Jane", last_name: "Smith", other_names: "Abena")
    expect(Employee.search("Jane")).to eq([jane])
  end
  it "searches first_name, last_name, other_names, emp_id columns and returns an array if result is found" do
    jane = Fabricate(:employee, emp_id: 1, first_name: "Jane", last_name: "Smith", other_names: "Abena")
    bob = Fabricate(:employee, emp_id: 2, first_name: "Bob", last_name: "Doe", other_names: "Kofi")
    expect(Employee.search("Doe")).to eq([bob])
  end
  it "returns an array if search for emp id is separated by commas" do
    jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena")
    bob = Fabricate(:employee, emp_id: "emp_2", first_name: "Bob", last_name: "Doe", other_names: "Kofi")
    alice = Fabricate(:employee, emp_id: "emp_3", first_name: "Alice", last_name: "Agram", other_names: "Ama")
    expect(Employee.search("emp_1, emp_2, emp_3")).to eq([jane, bob, alice])
  end
  it "returns an empty array when no record is found" do
    jane = Fabricate(:employee, emp_id: "emp_1", first_name: "Jane", last_name: "Smith", other_names: "Abena")
    bob = Fabricate(:employee, emp_id: "emp_2", first_name: "Bob", last_name: "Doe", other_names: "Kofi")
    expect(Employee.search("William")).to eq ([])
  end
 end
end
