module Api
  module V1
    class PasswordsController < ApplicationController
      skip_before_action :authenticate
      def forgot
        render json: { error: 'Email not present' } if params[:email].blank?
        user = Api::V1::User.find_by(email: params[:email])
        if user.present?
          # send email here
          render json: { successs: true }, status: :ok
        else
          render json: { error: 'Email address not found. Please check and Try again.' }, status: :not_found
        end
      end

      def reset
        token = params[:token].to_s
        render json: { error: 'Token not present' }, status: :unprocessable_entity if params[:email].blank?
        user = Api::V1::User.find_by(reset_password_token: token)
        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: { success: true }, status: :ok
          else
            render json: { error: user.errors.full_messages[0] }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Link not valid or expired. Try generating a new link.' }, stauts: :not_found
        end
      end
    end
  end
end
