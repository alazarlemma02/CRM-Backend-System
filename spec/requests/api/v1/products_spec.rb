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

      describe 'GET /api/v1/products' do
        it 'returns the product images' do
          count = 2
          products = create_list(:product, count)
          expected_urls = []
          products.each do |product|
            files = [
              File.open(Rails.root.join('spec', 'fixtures', 'images', 'product_1.jpeg')),
              File.open(Rails.root.join('spec', 'fixtures', 'images', 'product_2.jpg'))
            ]
            product.product_images.attach(files)
            expected_urls << product.product_images.map do |product_image|
              Rails.application.routes.url_helpers.rails_blob_url(product_image, only_path: false)
            end
          end

          get(api_v1_products_url, headers: {})
          result = JSON(response.body)

          expect(response).to have_http_status(:ok)
          expect(result['data'].count).to eq(count)
          expect(result['data'].map { |product| product['product_images_url'] }).to eq(expected_urls)
        end
      end
    end
  end
end
