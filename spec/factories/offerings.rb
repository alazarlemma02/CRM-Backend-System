# frozen_string_literal: true

FactoryBot.define do
  factory :offering do
    offer_title { Faker::Lorem.sentence }
    offer_start_date { Faker::Time.backward(days: 14) }
    offer_end_date { Faker::Time.forward(days: 14) }
    offer_description { Faker::Lorem.paragraph }
    product
    offer_type
  end
end
