FactoryBot.define do
  factory :user, class: 'Api::V1::User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    password { Faker::Internet.password }
    user_type { Api::V1::User.user_types[:customer] }
    date_of_birth { Faker::Date.between(from: 80.years.ago, to: 18.years.ago) }
    user_name { Faker::Internet.unique.username(specifier: 5..8) }
    address
    role
  end
end
