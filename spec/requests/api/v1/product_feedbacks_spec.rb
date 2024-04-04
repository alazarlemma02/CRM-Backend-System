# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProductFeedbacks', type: :request do
  include_examples('request_shared_spec', 'product_feedbacks', 7)

  let(:valid_attributes) do
    {
      feedback_content: Faker::Lorem.paragraph,
      feedback_datetime: Faker::Time.backward(days: 14),
      user_id: create(:user).id,
      product_id: create(:product).id
    }
  end

  let(:invalid_attributes) do
    {
      feedback_content: nil,
      feedback_datetime: Faker::Time.backward(days: 14),
      user_id: create(:user).id,
      product_id: create(:product).id
    }
  end

  let(:new_attributes) do
    {
      feedback_content: Faker::Lorem.word
    }
  end
end
