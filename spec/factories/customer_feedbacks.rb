FactoryBot.define do
  factory :customer_feedback do
    feedback_title { Faker::Lorem.sentence }
    feedback_comment { Faker::Lorem.paragraph }
    feedback_datetime { Faker::Time.backward(days: 14) }
    customer
  end
end