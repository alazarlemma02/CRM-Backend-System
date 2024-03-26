# frozen_string_literal: true

# spec/requests/offer_types_spec.rb
require 'rails_helper'

RSpec.describe 'OfferTypes', type: :request do
  include_examples('request_shared_spec', 'offer_types', 2)

  let(:valid_attributes) do
    {
      offer_type_name: Faker::Lorem.word
    }
  end

  let(:invalid_attributes) do
    {
      offer_type_name: nil
    }
  end

  let(:new_attributes) do
    {
      offer_type_name: Faker::Lorem.word
    }
  end
end
