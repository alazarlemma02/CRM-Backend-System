require 'rails_helper'

module Api
  module V1
    RSpec.describe Api::V1::PasswordsController, type: :request do
      describe 'POST #forgot' do
        let(:user) { create(:user) }

        context 'when email is valid' do
          before do
            post api_v1_password_forgot_url, params: { email: user.email }
          end

          it 'returns http success' do
            expect(response).to have_http_status(:ok)
          end

          it 'sends an email' do
            expect(ActionMailer::Base.deliveries.count).to eq(1)
          end
        end

        context 'when email is invalid' do
          before do
            post api_v1_password_forgot_url, params: { email: 'invalid@example.com' }
          end

          it 'returns http not_found' do
            expect(response).to have_http_status(:not_found)
          end
        end
      end

      describe 'POST #reset' do
        let(:user) { create(:user) }

        context 'when token is valid' do
          before do
            user.generate_password_token!
            post api_v1_password_reset_url, params: { token: user.reset_password_token, password: 'new_password' }
          end

          it 'returns http success' do
            expect(response).to have_http_status(:ok)
          end

          it 'resets the password' do
            expect(user.reload.authenticate('new_password')).to be_truthy
          end
        end

        context 'when token is invalid' do
          before do
            post api_v1_password_reset_url, params: { token: 'invalid_token', password: 'new_password' }
          end

          it 'returns http not_found' do
            expect(response).to have_http_status(:not_found)
          end
        end
      end
    end
  end
end
