# frozen_string_literal: true

FactoryBot.define do
  factory :message, class: 'Api::V1::Message' do
    content { Faker::Lorem.word }
    status { false }
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end
