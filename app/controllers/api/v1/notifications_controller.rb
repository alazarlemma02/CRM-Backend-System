# frozen_string_literal: true

module Api
  module V1
    class NotificationsController < Api::V1::ApplicationController
      before_action :set_notification, only: %i[destroy]

      def index
        notifications = @current_user.notifications.all
        render json: notifications
      end

      def show
        notification = @current_user.notifications.find(params[:id])
        render json: notification
      end

      def create
        notification = Api::V1::Notification.new(notification_params)
        if notification.save
          render json: notification, status: :created
        else
          render json: notification.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @notification.destroy
        render json: { notification: 'Notification deleted' }
      end

      private

      def set_notification
        @notification = Api::V1::Notification.find(params[:id])
      end

      def notification_params
        params.require(:payload).permit(:user_id, :message_id)
      end
    end
  end
end
