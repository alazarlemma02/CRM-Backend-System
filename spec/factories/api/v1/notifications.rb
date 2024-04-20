# frozen_string_literal: true

FactoryBot.define do
  factory :notification, class: 'Api::V1::Notification' do
    user
    message
  end
end
