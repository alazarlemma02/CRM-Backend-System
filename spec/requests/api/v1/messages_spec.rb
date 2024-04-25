require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Messages', type: :request do
      let!(:user) { create(:user) }
      let(:recipient) { create(:user) }
      let(:token) do
        Api::V1::TokenAuthServices.issue(
          user_id: user.id, email: user.email, phone_number: user.phone_number, user_name: user.user_name
        )
      end
      let(:headers) { { Authorization: "Bearer #{token}" } }

      describe 'GET /index' do
        it 'returns a success response' do
          create_list(:message, 3, sender: user, recipient:)
          get api_v1_user_messages_url(user), headers:, as: :json
          expect(response).to be_successful
          result = JSON(response.body)

          expect(result.size).to eq(3)
        end
      end

      describe 'GET /show' do
        it 'returns a success response' do
          message = create(:message, sender: user, recipient:)
          get api_v1_user_message_url(user, message), headers:, as: :json
          expect(response).to be_successful
          result = JSON(response.body)

          expect(result['id']).to eq(message.id)
        end
      end
    end
  end
end
