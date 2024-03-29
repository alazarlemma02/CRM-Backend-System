# frozen_string_literal: true

FactoryBot.define do
  factory :user_feedback, class: 'Api::V1::UserFeedback' do
    feedback_title { Faker::Lorem.sentence }
    feedback_content { Faker::Lorem.paragraph }
    feedback_datetime { Faker::Time.backward(days: 30) }
    user
  end
end
