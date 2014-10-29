# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Employee.delete_all
Gender.delete_all
male = Gender.create!(name: "Male")
female = Gender.create!(name: "Female")

50.times do
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id)
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, dob: Faker::Date.backward(14600).strftime("%Y-%m-%d"), gender_id: female.id)
end
