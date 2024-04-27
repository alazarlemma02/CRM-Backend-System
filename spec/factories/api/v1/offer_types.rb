FactoryBot.define do
  factory :offer_type, class: 'Api::V1::OfferType' do
    sequence(:offer_type_name) { |n| "#{Faker::Lorem.word}_#{n}" }
  end
end
