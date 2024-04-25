# spec/requests/user_feedbacks_spec.rb
require 'rails_helper'

RSpec.describe 'UserFeedbacks', type: :request do
  include_examples('request_shared_spec', 'user_feedbacks', 5)

  let(:valid_attributes) do
    {
      feedback_title: Faker::Lorem.word,
      feedback_content: Faker::Lorem.paragraph,
      feedback_datetime: Faker::Time.backward(days: 14),
      user_id: create(:user).id
    }
  end

  let(:invalid_attributes) do
    {
      feedback_title: nil,
      feedback_content: Faker::Lorem.paragraph,
      feedback_datetime: Faker::Time.backward(days: 14),
      user_id: create(:user).id
    }
  end

  let(:new_attributes) do
    {
      feedback_title: Faker::Lorem.word
    }
  end
end
