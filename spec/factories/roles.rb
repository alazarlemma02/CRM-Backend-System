# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    role_name { Faker::Job.title }
  end
end
