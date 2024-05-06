require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Messages', type: :request do
      let!(:customer) { create(:user, user_type: Api::V1::User.user_types[:customer]) }
      let(:salesman) { create(:user, user_type: Api::V1::User.user_types[:salesman]) }
      let(:user) { create(:user, user_type: Api::V1::User.user_types[:customer]) }
      let(:customer_token) do
        Api::V1::TokenAuthServices.issue(
          user_id: customer.id, email: customer.email,
          phone_number: customer.phone_number, user_name: customer.user_name
        )
      end
      let(:salesman_token) do
        Api::V1::TokenAuthServices.issue(
          user_id: salesman.id, email: salesman.email,
          phone_number: salesman.phone_number, user_name: salesman.user_name
        )
      end
      let(:user_token) do
        Api::V1::TokenAuthServices.issue(
          user_id: user.id, email: user.email,
          phone_number: user.phone_number, user_name: user.user_name
        )
      end
      let(:customer_headers) { { Authorization: "Bearer #{customer_token}" } }
      let(:salesman_headers) { { Authorization: "Bearer #{salesman_token}" } }
      let(:user_headers) { { Authorization: "Bearer #{user_token}" } }

      let(:valid_params) do
        {
          recipient_id: salesman.id, content: 'Hello Salesman, I have a question.'
        }
      end

      let(:invalid_params) do
        {
          recipient_id: user.id, content: 'Hello You, How are you?'
        }
      end

      let(:valid_attributes) { { payload: valid_params } }
      let(:invalid_attributes) { { payload: invalid_params } }

      describe 'GET /index' do
        it 'returns a success response' do
          create_list(:message, 3, sender: customer, recipient: salesman)
          get api_v1_user_messages_url(salesman), headers: salesman_headers, as: :json
          expect(response).to be_successful
          result = JSON(response.body)

          expect(result['data'].count).to eq(3)
        end

        it 'returns an empty array if no messages are found for the current user' do
          get api_v1_user_messages_url(user), headers: user_headers, as: :json
          expect(response).to be_successful
          result = JSON(response.body)

          expect(result['data']).to eq([])
          expect(result['data'].count).to eq(0)
        end
      end

      describe 'GET /show' do
        it 'returns a success response' do
          message = create(:message, sender: customer, recipient: salesman)
          get api_v1_user_message_url(customer, message), headers: customer_headers, as: :json
          expect(response).to be_successful
          result = JSON(response.body)

          expect(result['data']['id']).to eq(message.id)
        end
      end

      describe 'POST /create' do
        it 'creates a new message with valid params' do
          expect do
            post api_v1_user_messages_url(customer), params: valid_attributes, headers: customer_headers, as: :json
          end.to change(Api::V1::Message, :count).by(1)
          expect(response).to have_http_status(:created)
        end
        it 'doesn\'t create a new message with invalid params' do
          expect do
            post api_v1_user_messages_url(customer), params: invalid_attributes, headers: customer_headers, as: :json
          end.to change(Api::V1::Message, :count).by(0)
          expect(response).to have_http_status(:bad_request)
        end
        it 'returns an error if sender_id does not match current user id' do
          post api_v1_user_messages_url(customer), params: valid_attributes.merge(sender_id: customer.id),
                                                   headers: salesman_headers, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
        end
        it 'returns an error if recipient_id is the same as sender_id' do
          post api_v1_user_messages_url(salesman), params: valid_attributes.merge(recipient_id: salesman.id),
                                                   headers: salesman_headers, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
