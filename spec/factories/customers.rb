FactoryBot.define do
  factory :customer do
    customer_name { Faker::Name.name }
    customer_mobile { Faker::PhoneNumber.cell_phone }
    customer_email { Faker::Internet.email }
    customer_profile_picture { Faker::Avatar.image }
    password_digest { Faker::Internet.password }
    address
    role
  end
end