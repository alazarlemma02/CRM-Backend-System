# frozen_string_literal: true

# spec/requests/offerings_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Offerings', type: :request do
      include_examples('request_shared_spec', 'offerings', 9)

      let(:valid_attributes) do
        {
          offer_title: Faker::Lorem.word,
          offer_description: Faker::Lorem.sentence,
          offer_start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
          offer_end_date: Faker::Time.forward(days: 23),
          product_id: create(:product).id,
          offer_type_id: create(:offer_type).id
        }
      end

      let(:invalid_attributes) do
        {
          offer_title: nil,
          offer_description: Faker::Lorem.sentence,
          offer_start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
          offer_end_date: Faker::Time.forward(days: 23),
          product_id: create(:product).id,
          offer_type_id: create(:offer_type).id
        }
      end

      let(:new_attributes) do
        {
          offer_title: Faker::Lorem.word
        }
      end
    end
  end
end
