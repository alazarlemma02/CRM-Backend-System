FactoryBot.define do
  factory :product_category do
    product_category_name { Faker::Commerce.department(max: 2) }
  end
end
