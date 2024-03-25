# frozen_string_literal: true

FactoryBot.define do
  factory :communication do
    communication_type { Faker::Lorem.word }
    communication_datetime { Faker::Time.backward(days: 14) }
    communication_content { Faker::Lorem.paragraph }
    user
  end
end
