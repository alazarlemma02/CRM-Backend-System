FactoryBot.define do
  factory :product_type, class: 'Api::V1::ProductType' do
    product_type_name { Faker::Commerce.unique.department }
  end
end
