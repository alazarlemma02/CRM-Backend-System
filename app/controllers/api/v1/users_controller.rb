# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include Common
      # before_action :find_user, only: %i[show update destroy]
      skip_before_action :authenticate, only: %i[create]

      def show
        super do
          user = Api::V1::User.with_attached_images.find(params[:id])
          user
        end
      end

      private

      def model_params
        params.require(:payload).permit(:first_name, :last_name, :email, :phone_number, :profile_picture,
                                        :password, :address_id, :role_id, :user_type, :date_of_birth, :user_name)
      end
    end
  end
end
