# frozen_string_literal: true

# spec/requests/products_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Products', type: :request do
      include_examples('request_shared_spec', 'products', 10)

      let(:valid_attributes) do
        {
          product_name: Faker::Lorem.word,
          product_price: Faker::Number.decimal(l_digits: 2),
          product_description: Faker::Lorem.sentence,
          product_image: Faker::Avatar.image(size: '50x60'),
          average_rating: Faker::Number.between(from: 1, to: 5),
          product_quantity_count: Faker::Number.between(from: 1, to: 100),
          product_type_id: create(:product_type).id,
          product_category_id: create(:product_category).id,
          product_quantity_type_id: create(:product_quantity_type).id
        }
      end

      let(:invalid_attributes) do
        {
          product_name: nil,
          product_price: Faker::Number.decimal(l_digits: 2),
          product_description: Faker::Lorem.sentence,
          product_image: Faker::Avatar.image(size: '50x60'),
          average_rating: Faker::Number.between(from: 1, to: 5),
          product_quantity_count: Faker::Number.between(from: 1, to: 100),
          product_type_id: create(:product_type).id,
          product_category_id: create(:product_category).id,
          product_quantity_type_id: create(:product_quantity_type).id
        }
      end

      let(:new_attributes) do
        {
          product_name: Faker::Lorem.word
        }
      end
    end
  end
end
