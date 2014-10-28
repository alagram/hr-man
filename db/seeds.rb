# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Employee.delete_all
Gender.delete_all
male = Gender.create!(sex: "Male")
female = Gender.create!(sex: "Female")
Employee.create!(first_name: "Jack", last_name: "Smith", other_names: "Donkor", dob: "12-09-1986", gender_id: male.id)
