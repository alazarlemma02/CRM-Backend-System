# frozen_string_literal: true

# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include_examples('request_shared_spec', 'users', 12)

  let(:valid_attributes) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      profile_picture: Faker::Avatar.image,
      password_digest: Faker::Internet.password,
      user_type: User.user_types[:customer],
      date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago),
      user_name: Faker::Internet.username(specifier: 5..8),
      address_id: create(:address).id,
      role_id: create(:role).id
    }
  end

  let(:invalid_attributes) do
    {
      first_name: nil,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      profile_picture: Faker::Avatar.image,
      password_digest: Faker::Internet.password,
      user_type: User.user_types[:customer],
      date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago),
      user_name: Faker::Internet.username(specifier: 5..8),
      address_id: create(:address).id,
      role_id: create(:role).id
    }
  end

  let(:new_attributes) do
    {
      first_name: Faker::Name.first_name
    }
  end
end
