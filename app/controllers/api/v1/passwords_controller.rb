module Api
  module V1
    class PasswordsController < ApplicationController
      skip_before_action :authenticate

      def forgot
        if params[:email].blank?
          render json: { success: false, error: 'Email not present' }, status: :not_found
          return
        end

        @user = Api::V1::User.find_by(email: params[:email])
        if @user.present?
          @user.generate_password_token!
          Api::V1::UserMailer.forgot_password(@user).deliver_now
          render json: {
                   success: true,
                   message: "An email has been sent to #{params[:email]} with further instructions."
                 },
                 status: :ok
        else
          render json: { success: false, error: 'Email address not found. Please check and try again.' },
                 status: :not_found
        end
      end

      def reset
        token = params[:token].to_s
        render json: { success: false, error: 'Token not present' }, status: :not_found if token.blank?

        user = Api::V1::User.find_by(reset_password_token: token)
        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: { success: true, message: 'Your password has been successfully updated.' }, status: :ok
          else
            render json: { error: user.errors.full_messages[0] }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Link not valid or expired. Try generating a new link.' }, status: :not_found
        end
      end
    end
  end
end
