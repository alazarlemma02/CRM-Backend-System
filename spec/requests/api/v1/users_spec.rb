# frozen_string_literal: true

# spec/requests/users_spec.rb
require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Users', type: :request do
      include_examples('request_shared_spec', 'users', 15, %i[create index])

      let(:valid_attributes) do
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          phone_number: Faker::PhoneNumber.cell_phone,
          profile_picture: Faker::Avatar.image,
          password: Faker::Internet.password,
          user_type: Api::V1::User.user_types[:customer],
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
          password: Faker::Internet.password,
          user_type: Api::V1::User.user_types[:customer],
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

      describe 'GET #index' do
        context 'when the user is a salesman' do
          it 'returns all users' do
            salesman = create(:user, user_type: 'salesman')
            token =
              Api::V1::TokenAuthServices.issue(
                user_id: salesman.id, email: salesman.email, phone_number: salesman.phone_number,
                user_name: salesman.user_name
              )
            headers = { Authorization: "Bearer #{token}" }
            create_list(:user, 3)

            get(api_v1_users_url, headers:)
            result = JSON(response.body)

            expect(response).to be_successful
            expect(result['data'].count).to eq(5)
          end
        end

        context 'when the user is a customer' do
          it 'returns the customer and all salesman users' do
            create_list(:user, 2, user_type: 'salesman')

            get(api_v1_users_url, headers:)
            result = JSON(response.body)

            expect(response).to be_successful
            expect(result['data'].count).to eq(3)
          end
        end
      end
    end
  end
end
