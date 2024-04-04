# frozen_string_literal: true

FactoryBot.define do
  factory :product_feedback, class: 'Api::V1::ProductFeedback' do
    feedback_content { Faker::Lorem.paragraph }
    feedback_datetime { Faker::Time.backward(days: 30) }
    product_rating { Faker::Number.between(from: 1, to: 5) }
    user
    product
  end
end
