# frozen_string_literal: true

# spec/requests/product_quantity_types_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'ProductQuantityTypes', type: :request do
      include_examples('request_shared_spec', 'product_quantity_types', 2)

      let(:valid_attributes) do
        {
          product_quantity_type: Faker::Lorem.word
        }
      end

      let(:invalid_attributes) do
        {
          product_quantity_type: nil
        }
      end

      let(:new_attributes) do
        {
          product_quantity_type: Faker::Lorem.word
        }
      end
    end
  end
end
