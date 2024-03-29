# frozen_string_literal: true

# spec/requests/communications_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Communications', type: :request do
      include_examples('request_shared_spec', 'communications', 5)

      let(:valid_attributes) do
        {
          communication_type: Faker::Lorem.word,
          communication_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
          communication_content: Faker::Lorem.sentence,
          user_id: create(:user).id
        }
      end

      let(:invalid_attributes) do
        {
          communication_type: Faker::Lorem.word,
          communication_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
          communication_content: nil,
          user_id: create(:user).id
        }
      end

      let(:new_attributes) do
        {
          communication_content: Faker::Lorem.sentence
        }
      end
    end
  end
end
