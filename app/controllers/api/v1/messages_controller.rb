module Api
  module V1
    class MessagesController < Api::V1::ApplicationController
      before_action :set_message, only: %i[show update destroy]

      def index
        @messages = Api::V1::Message.all
        render json: { success: true, data: @messages }, status: :ok
      end

      def show
        render json: { success: true, data: @message }, status: :ok
      end

      def create
        @message = Api::V1::Message.new(message_params)
        if @message.save
          Api::V1::NotificationServices.send_notification_to_recipient(@message)
          ActionCable.server.broadcast 'message_channel', { message: @message.content, sender_id: @message.sender_id,
                                                            recipient_id: @message.recipient_id, status: false }
          render json: { success: true, data: @message }, status: :created
        else
          render json: { success: false, data: @message.errors.full_messages[0] }, status: :unprocessable_entity
        end
      end

      def update
        if @message.update(message_params)
          render json: { success: true, data: @message }, status: :ok
        else
          render json: { success: false, data: @message.errors.full_messages[0] }, status: :unprocessable_entity
        end
      end

      def destroy
        @message.destroy
        render json: { success: true, message: 'Message deleted' }, status: :ok
      end

      private

      def set_message
        @message = Api::V1::Message.find(params[:id])
      end

      def message_params
        params.require(:payload).permit(:sender_id, :recipient_id, :content, :status)
      end
    end
  end
end
