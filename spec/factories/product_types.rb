FactoryBot.define do
  factory :product_type do
    product_type_name { Faker::Commerce.department }
  end
end