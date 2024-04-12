# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include Common
      # before_action :find_user, only: %i[show update destroy]
      skip_before_action :authenticate, only: %i[create]

      def index
        super do
          if @current_user.user_type == 'salesman'
            Api::V1::User.all
          else
            salesman_users = Api::V1::User.where(user_type: 'salesman')
            current_user = Api::V1::User.where(id: @current_user.id)
            users = salesman_users.or(current_user)
            users
          end
        end
      end

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
