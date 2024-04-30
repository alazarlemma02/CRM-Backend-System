module Api
  module V1
    class NotificationsController < Api::V1::ApplicationController
      before_action :set_notification, only: %i[destroy]

      def index
        notifications = @current_user.notifications.all
        render json: { success: true, data: notifications }, status: :ok
      end

      def show
        notification = @current_user.notifications.find(params[:id])
        render json: { success: true, data: notification }, status: :ok
      end

      def create
        notification = Api::V1::Notification.new(notification_params)
        if notification.save
          render json: { success: true, data: notification }, status: :created
        else
          render json: { success: false, error: notification.errors.full_messages[0]}, status: :unprocessable_entity
        end
      end

      def destroy
        @notification.destroy
        render json: { success: true, notification: 'Notification deleted' }, status: :ok
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
