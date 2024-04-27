module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :authenticate

      private

      def authenticate
        auth_header = request.headers['Authorization']
        if auth_header.present?
          token = auth_header.split.last
          decoded_token = Api::V1::TokenAuthServices.decode(token)
          if Api::V1::TokenAuthServices.valid?(token) && decoded_token.present?
            @current_user = Api::V1::User.find(decoded_token['user_id'])
          else
            render json: { error: 'Invalid or expired token' }, status: :unauthorized
          end
        else
          render json: { error: 'Missing or invalid Authorization header' }, status: :unauthorized
        end
      rescue JWT::DecodeError
        render json: { error: 'Invalid JWT token' }, status: :unauthorized
      end
    end
  end
end
