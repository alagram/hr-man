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

accounts = Department.create(name: Faker::Commerce.department(2, true), isactive: true)
finance = Department.create(name: Faker::Commerce.department(2, true), isactive: true)
legal = Department.create(name: "Legal", isactive: true)

Gender.create(name: "Male", isactive: true)
Gender.create(name: "Female", isactive: true)

dev = JobTitle.create(name: "Web Developer", isactive: true)
cmo = JobTitle.create(name: "CMO", isactive: true)
cto = JobTitle.create(name: "CTO", isactive: true)
cfo = JobTitle.create(name: "CFO", isactive: true)

ghana = Nationality.create(name: "Ghanaian", isactive: true)
america = Nationality.create(name: "American", isactive: true)
british = Nationality.create(name: "British", isactive: true)



black = Race.create(name: "Black", isactive: true)
white = Race.create(name: "White", isactive: true)
latino = Race.create(name: "Latino", isactive: true)

State.create(name: "Ashanti Region", isactive: true)
State.create(name: "Greater Accra", isactive: true)

contractor = Type.create(name: "Contractor", isactive: true)
perma = Type.create(name: "Permanent", isactive: true)
casual = Type.create(name: "Casual", isactive: true)

single = Marital.create(name: "Single", isactive: true)
married = Marital.create(name: "Married", isactive: true)
divorced = Marital.create(name: "Divorced", isactive: true)

line_manager = UserGroup.create(name: "Line Manager", isactive: true)
team_lead = UserGroup.create(name: "Team Lead", isactive: true)
direct_report = UserGroup.create(name: "Direct Report", isactive: true)

manager_1 = Employee.create!(first_name: "Albert", last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: team_lead.id, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", emp_id: "EMP01", password: "password", email: Faker::Internet.email, cellphone: Faker::PhoneNumber.cell_phone, officephone: Faker::PhoneNumber.cell_phone, remote_employee_image_url: Faker::Avatar.image, job_title_id: cto.id, nationality_id: ghana.id, ethnicity: black, department: legal, marital: married, type: perma, zipcode: Faker::Address.zip_code, ssn: "SSN0000#{rand(1000)}")
manager_2 = Employee.create!(first_name: "Mawunyo", last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: line_manager.id, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", emp_id: "EMP02", password: Faker::Internet.password, email: Faker::Internet.email, cellphone: Faker::PhoneNumber.cell_phone, officephone: Faker::PhoneNumber.cell_phone, remote_employee_image_url: Faker::Avatar.image, job_title_id: cfo.id, nationality_id: america.id, ethnicity: white, department: accounts, marital: single, type: perma, zipcode: Faker::Address.zip_code, ssn: "SSN0000#{rand(1000)}")
manager_3 = Employee.create!(first_name: "Esinam", last_name: Faker::Name.last_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"), gender_id: male.id, user_group_id: line_manager.id, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", emp_id: "EMP03", password: Faker::Internet.password, email: Faker::Internet.email, cellphone: Faker::PhoneNumber.cell_phone, officephone: Faker::PhoneNumber.cell_phone, remote_employee_image_url: Faker::Avatar.image, job_title_id: dev.id, nationality_id: british.id, ethnicity: latino, department: finance, marital: divorced, type: perma, zipcode: Faker::Address.zip_code, ssn: "SSN0000#{rand(1000)}")

30.times do
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, dob: Faker::Date.backward(7300).strftime("%Y-%m-%d"),
                    gender_id: male.id, user_group_id: direct_report.id, manager: manager_1, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}",
                    emp_id: "EMP#{rand(100)}", password: Faker::Internet.password, email: Faker::Internet.email, cellphone: Faker::PhoneNumber.cell_phone, officephone: Faker::PhoneNumber.cell_phone, remote_employee_image_url: Faker::Avatar.image, job_title_id: cfo.id, nationality_id: ghana.id, ethnicity: black, department: legal, marital: single, type: perma, zipcode: Faker::Address.zip_code, ssn: "SSN0000#{rand(1000)}")
  Employee.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, dob: Faker::Date.backward(14600).strftime("%Y-%m-%d"), gender_id: female.id, user_group_id: direct_report.id, manager: manager_2, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", password: Faker::Internet.password, email: Faker::Internet.email, cellphone: Faker::PhoneNumber.cell_phone, officephone: Faker::PhoneNumber.cell_phone, remote_employee_image_url: Faker::Avatar.image, job_title_id: dev.id, nationality_id: america.id, ethnicity: white, department: accounts, marital: married, type: contractor, zipcode: Faker::Address.zip_code, ssn: "SSN0000#{rand(1000)}")
end

60.times do
  NextOfKin.create(title: Faker::Name.prefix, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, telephone: Faker::PhoneNumber.phone_number, mobile: Faker::PhoneNumber.cell_phone, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", percentage: 10.0, employee: Employee.limit(1).order("RANDOM()").first)
end

60.times do
  Emergency.create(title: Faker::Name.prefix, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, other_names: Faker::Name.first_name, telephone: Faker::PhoneNumber.phone_number, address1: "#{Faker::Address.street_address}, #{Faker::Address.state}", mobile: Faker::PhoneNumber.cell_phone, employee: Employee.limit(1).order("RANDOM()").first)
end

sick = LeaveType.create(name: "Sick Leave", isactive: true)
maternity = LeaveType.create(name: "Maternity Leave", isactive: true)
paternity = LeaveType.create(name: "Paternity Leave", isactive: true)
compassionate = LeaveType.create(name: "Compassionate Leave", isactive: true)


