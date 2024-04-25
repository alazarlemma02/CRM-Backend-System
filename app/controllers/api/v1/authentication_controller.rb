module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate
      def login
        @user = Api::V1::User.find_by(email: login_params[:email])
        if @user&.authenticate(login_params[:password])
          token = Api::V1::TokenAuthServices.issue(user_id: @user.id, username: @user.user_name, email: @user.email)
          render json: { token:, username: @user.user_name, email: @user.email }, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def logout
        token = request.headers['Authorization']&.split&.last
        if token.present?
          Api::V1::TokenAuthServices.invalidate(token)
          render json: { message: 'Logged out successfully' }, status: :ok
        else
          render json: { error: 'Missing token' }, status: :unprocessable_entity
        end
      end

      private

      def login_params
        params.require(:payload).permit(:email, :password)
      end
    end
  end
end
