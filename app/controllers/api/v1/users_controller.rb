# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[create]
      after_action :send_email, only: %i[create]

      def show
        super do
          user = Api::V1::User.with_attached_images.find(params[:id])
          user
        end
      end

      private

      def send_email
        Api::V1::UserMailer.welcome_email(@obj).deliver_now if @obj.present?
      end

      def model_params
        params.require(:payload).permit(:first_name, :last_name, :email, :phone_number, :profile_picture,
                                        :password, :address_id, :role_id, :user_type, :date_of_birth, :user_name)
      end
    end
  end
end
