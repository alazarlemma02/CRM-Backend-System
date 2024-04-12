# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe Product, type: :model do
      attributes = [
        { product_name: :presence },
        { product_price: :presence },
        { product_quantity_count: :presence },
        { average_rating: :presence },
        { product_type: :belong_to },
        { product_category: :belong_to },
        { product_quantity_type: :belong_to },
        { product_feedbacks: :have_many }
      ]
      include_examples('model_shared_spec', :product, attributes)

      describe 'Product active storage' do
        it { is_expected.to have_many_attached(:product_images) }
      end

      describe '#product_images_url' do
        it 'returns the correct URL when product images are attached' do
          product = create(:product)
          files = [
            File.open(Rails.root.join('spec', 'fixtures', 'images', 'product_1.jpeg')),
            File.open(Rails.root.join('spec', 'fixtures', 'images', 'product_2.jpg'))
          ]
          product.product_images.attach(files)
          expected_urls = product.product_images.map do |product_image|
            Rails.application.routes.url_helpers.rails_blob_url(product_image, only_path: false)
          end
          expect(product.product_images_url.sort).to match_array(expected_urls.sort)
        end

        it 'returns an empty array when product images are not attached' do
          product = create(:product)
          expect(product.product_images_url).to eq []
        end
      end
    end
  end
end
