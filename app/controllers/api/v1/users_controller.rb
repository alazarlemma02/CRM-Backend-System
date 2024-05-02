module Api
  module V1
    class UsersController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[create]
      after_action :send_email, only: %i[create]
      before_action :authenticate_admin, only: %i[create_salesman create_admin]

      def show
        super do
          user = Api::V1::User.with_attached_images.find(params[:id])
          user
        end
      end

      def create_salesman
        create do
          user = @clazz.new(model_params)
          user.user_type = :salesman
          user
        end
      end

      def create_admin
        create do
          user = @clazz.new(model_params)
          user.user_type = :admin
          user
        end
      end

      private

      def send_email
        Api::V1::UserMailer.welcome_email(@obj).deliver_now if @obj.present?
      end

      def authenticate_admin
        return if @current_user&.admin?

        render json: { success: false, error: 'Only admin can perform this action' },
               status: :forbidden
      end

      def model_params
        params.require(:payload).permit(:first_name, :last_name, :email, :phone_number, :profile_picture,
                                        :password, :address_id, :role_id, :date_of_birth, :user_name)
      end
    end
  end
end
