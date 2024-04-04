# frozen_string_literal: true

FactoryBot.define do
  factory :product_feedback, class: 'Api::V1::ProductFeedback' do
    feedback_content { Faker::Lorem.paragraph }
    feedback_datetime { Faker::Time.backward(days: 30) }
    user
    product
  end
end
