FactoryBot.define do
  factory :role do
    role_name { Faker::Job.title }
  end
end