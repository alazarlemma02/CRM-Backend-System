# frozen_string_literal: true

FactoryBot.define do
  factory :product_quantity_type do
    product_quantity_type { Faker::Lorem.word }
  end
end
