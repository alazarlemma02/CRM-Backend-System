FactoryBot.define do
  factory :salesman do
    salesman_name { Faker::Name.name }
    salesman_mobile { Faker::PhoneNumber.cell_phone }
    salesman_email { Faker::Internet.email }
    salesman_profile_picture { Faker::Avatar.image }
    password_digest { Faker::Internet.password }
    address
    role
  end
end