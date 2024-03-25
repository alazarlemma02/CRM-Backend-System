# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    product_name { Faker::Commerce.product_name }
    product_price { Faker::Commerce.price(range: 10.0..100.0) }
    product_rating { Faker::Number.between(from: 1, to: 5) }
    product_description { Faker::Lorem.paragraph }
    product_image { Faker::Avatar.image }
    product_quantity_count { Faker::Number.between(from: 1, to: 100) }
    product_type
    product_category
    product_quantity_type
  end
end
