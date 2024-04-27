FactoryBot.define do
  factory :product_quantity_type, class: 'Api::V1::ProductQuantityType' do
    sequence(:product_quantity_type) { |n| "#{Faker::Lorem.word}_#{n}" }
  end
end
