FactoryBot.define do
  factory :product, class: 'Api::V1::Product' do
    product_name { Faker::Commerce.product_name }
    product_price { Faker::Commerce.price(range: 10.0..100.0) }
    product_description { Faker::Lorem.paragraph }
    product_quantity_count { Faker::Number.between(from: 1, to: 100) }
    product_type
    product_category
    product_quantity_type
  end
end
