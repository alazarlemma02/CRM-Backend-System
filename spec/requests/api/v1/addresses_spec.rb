# spec/requests/addresses_spec.rb
require 'rails_helper'
module Api
  module V1
    RSpec.describe 'Addresses', type: :request do
      include_examples('request_shared_spec', 'addresses', 6)

      let(:valid_attributes) do
        {
          region: Faker::Address.state,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          postal_code: Faker::Address.zip_code,
          country: Faker::Address.country
        }
      end

      let(:invalid_attributes) do
        {
          region: Faker::Address.state,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          postal_code: Faker::Address.zip_code,
          country: nil
        }
      end

      let(:new_attributes) do
        {
          postal_code: Faker::Address.zip_code
        }
      end
    end
  end
end
