# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    profile_picture { Faker::Avatar.image }
    password_digest { Faker::Internet.password }
    user_type { %w[Customer Salesman].sample }
    date_of_birth { Faker::Date.between(from: 80.years.ago, to: 18.years.ago) }
    user_name { Faker::Internet.username(specifier: 5..8) }
    address
    role
  end
end
