# frozen_string_literal: true

# spec/requests/product_categories_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'ProductCategories', type: :request do
      include_examples('request_shared_spec', 'product_categories', 2)

      let(:valid_attributes) do
        {
          product_category_name: Faker::Lorem.word
        }
      end

      let(:invalid_attributes) do
        {
          product_category_name: nil
        }
      end

      let(:new_attributes) do
        {
          product_category_name: Faker::Lorem.word
        }
      end
    end
  end
end
