# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Authentication', type: :request do
      describe 'POST /api/v1/auth/login' do
        let(:user) { create(:user) }
        it 'authenticates user and returns token' do
          post '/api/v1/auth/login', params: { payload: { email: user.email, password: user.password } }
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)).to include('token')
        end

        it 'returns unauthorized for invalid credentials' do
          post '/api/v1/auth/login', params: { payload: { email: user.email, password: 'invalid_password' } }
          expect(response).to have_http_status(:unauthorized)
        end
      end

      describe 'POST /api/v1/auth/logout' do
        let(:user) { create(:user) }
        let(:token) { Api::V1::TokenAuthService.issue(user_id: user.id) }

        it 'invalidates token and logs out user' do
          request_headers = { 'Authorization' => "Bearer #{token}" }
          post '/api/v1/auth/logout', headers: request_headers
          expect(response).to have_http_status(:ok)
          expect(Api::V1::TokenAuthService.valid?(token)).to be_falsey
        end

        it 'returns unauthorized for missing token' do
          post '/api/v1/auth/logout'
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
