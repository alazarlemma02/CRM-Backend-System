FactoryBot.define do
  factory :product_category, class: 'Api::V1::ProductCategory' do
    sequence(:product_category_name) { |n| "#{Faker::Commerce.department(max: 2)}_#{n}" }
  end
end
