# spec/requests/product_types_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'ProductTypes', type: :request do
      include_examples('request_shared_spec', 'product_types', 2)

      let(:valid_attributes) do
        {
          product_type_name: Faker::Lorem.word
        }
      end

      let(:invalid_attributes) do
        {
          product_type_name: nil
        }
      end

      let(:new_attributes) do
        {
          product_type_name: Faker::Lorem.word
        }
      end
    end
  end
end
