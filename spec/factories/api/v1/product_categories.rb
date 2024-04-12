# frozen_string_literal: true

FactoryBot.define do
  factory :product_category, class: 'Api::V1::ProductCategory' do
    product_category_name { Faker::Commerce.department(max: 2) }
  end
end
