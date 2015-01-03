Fabricator(:employee) do
  emp_id { "EMP#{rand(100)}" }
  first_name { Faker::Name.first_name }
  other_names { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  dob { Faker::Date.backward(7300).strftime("%Y-%m-%d") }
  email { Faker::Internet.email }
  cellphone { %w(0800-12345 0800-54321 0800-098765 0234-1112234).sample }
  officephone { %w(0800-12345 0800-54321 0800-098765 0234-1112234).sample }
  password { Faker::Internet.password }
  manager_id { (1..10).to_a.sample }
  gender
end

Fabricator(:super_user, from: :employee) do
  admin true
end
