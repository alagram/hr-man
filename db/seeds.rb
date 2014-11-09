# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Employee.delete_all
Gender.delete_all
male = Gender.create!(name: "Male")
female = Gender.create!(name: "Female")
City.create(name: "Accra", isactive: true)
City.create(name: "Kumasi", isactive: true)

Country.create(name: "Ghana", isactive: true)
Country.create(name: "United Kingdon", isactive: true)
Country.create(name: "South Africa", isactive: true)

Department.create(name: Faker::Commerce.department(2, true), isactive: true)
Department.create(name: Faker::Commerce.department(2, true), isactive: true)
Department.create(name: "Legal", isactive: true)

Gender.create(name: "Male", isactive: true)
Gender.create(name: "Female", isactive: true)

JobTitle.create(name: "Web Developer", isactive: true)
JobTitle.create(name: "CMO", isactive: true)
JobTitle.create(name: "CTO", isactive: true)
JobTitle.create(name: "CFO", isactive: true)

Nationality.create(name: "Ghanaian", isactive: true)
Nationality.create(name: "American", isactive: true)
Nationality.create(name: "British", isactive: true)

Race.create(name: "Black", isactive: true)
Race.create(name: "White", isactive: true)
Race.create(name: "Latino", isactive: true)

State.create(name: "Ashanti Region", isactive: true)
State.create(name: "Greater Accra", isactive: true)

Type.create(name: "Contractor", isactive: true)
Type.create(name: "Permanent", isactive: true)
Type.create(name: "Casual", isactive: true)

Marital.create(name: "Single", isactive: true)
Marital.create(name: "Married", isactive: true)
Marital.create(name: "Divorced", isactive: true)

line_manager = UserGroup.create(name: "Line Manager", isactive: true)
team_lead = UserGroup.create(name: "Team Lead", isactive: true)
direct_report = UserGroup.create(name: "Direct Report", isactive: true)

manager_1 = Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: team_lead.id)
manager_2 = Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: line_manager.id)

30.times do
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: direct_report.id, manager: manager_1)
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, dob: Faker::Date.backward(14600).strftime("%Y-%m-%d"), gender_id: female.id, user_group_id: direct_report.id, manager: manager_2)
end
