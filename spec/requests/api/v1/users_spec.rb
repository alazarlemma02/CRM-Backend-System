# spec/requests/users_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Users', type: :request do
      include_examples('request_shared_spec', 'users', 13, %i[create update])

      let(:valid_attributes) do
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          phone_number: Faker::PhoneNumber.cell_phone,
          profile_picture: Faker::Avatar.image,
          password: Faker::Internet.password,
          date_of_birth: Faker::Date.between(from: 80.years.ago, to: 18.years.ago),
          user_name: Faker::Internet.username(specifier: 5..8),
          address_id: create(:address).id,
          role_id: create(:role).id
        }
      end

      let(:invalid_attributes) do
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: nil,
          phone_number: Faker::PhoneNumber.cell_phone,
          profile_picture: Faker::Avatar.image,
          password: Faker::Internet.password,
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

      describe 'GET #show' do
        it 'returns the profile picture' do
          user = create(:user)
          file = File.open(Rails.root.join('spec', 'fixtures', 'images', 'user_profile.jpg'))
          user.profile_picture.attach(io: file, filename: 'user_profile.jpg', content_type: 'image/jpg')
          expected_url = Rails.application.routes.url_helpers.rails_blob_url(user.profile_picture, only_path: false)

          get(api_v1_user_url(user), headers:)
          result = JSON(response.body)

          expect(response).to be_successful
          expect(result['data']['profile_picture_url']).to eq(expected_url)
        end
      end
    end
  end
end
