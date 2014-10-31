Fabricator(:employee) do
  emp_id { (1..5).to_a.sample }
  first_name { Faker::Name.first_name }
  other_names { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  dob { Faker::Date.backward(7300).strftime("%Y-%m-%d") }
  gender
end
