FactoryBot.define do
  factory :role, class: 'Api::V1::Role' do
    role_name { Faker::Job.title }
  end
end
