# frozen_string_literal: true

FactoryBot.define do
  factory :offer_type do
    offer_type_name { Faker::Lorem.word }
  end
end
