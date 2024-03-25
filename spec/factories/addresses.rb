# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    region { Faker::Address.state }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    postal_code { Faker::Address.postcode }
    country { Faker::Address.country }
  end
end
