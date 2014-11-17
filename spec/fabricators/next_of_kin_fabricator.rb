Fabricator(:next_of_kin) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  mobile { Faker::PhoneNumber.phone_number }
end
