# frozen_string_literal: true

FactoryBot.define do
  factory :offer_type, class: 'Api::V1::OfferType' do
    offer_type_name { Faker::Lorem.word }
  end
end
