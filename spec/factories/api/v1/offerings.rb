FactoryBot.define do
  factory :offering, class: 'Api::V1::Offering' do
    offer_title { Faker::Lorem.sentence }
    offer_start_date { Faker::Time.backward(days: 14) }
    offer_end_date { Faker::Time.forward(days: 14) }
    offer_description { Faker::Lorem.paragraph }
    product
    offer_type
  end
end
