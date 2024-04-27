FactoryBot.define do
  factory :address, class: 'Api::V1::Address' do
    region { Faker::Address.state }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    postal_code { Faker::Address.postcode }
    country { Faker::Address.country }
  end
end
