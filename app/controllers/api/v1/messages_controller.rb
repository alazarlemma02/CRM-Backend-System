module Api
  module V1
    class MessagesController < Api::V1::ApplicationController
      before_action :set_message, only: %i[show update destroy]

      def index
        @messages = @current_user.sent_messages + @current_user.received_messages
        render json: { success: true, data: @messages }, status: :ok
      end

      def show
        @message = @current_user.sent_messages.find_by(id: params[:id]) ||
                   @current_user.received_messages.find_by(id: params[:id])
        render json: { success: true, data: @message }, status: :ok
      end

      def create
        if message_params[:recipient_id].to_i == @current_user.id
          return render json: { success: false, message: "Recipient ID cannot be the same as the sender's ID" },
                        status: :unprocessable_entity
        end

        recipient = Api::V1::User.find_by(id: message_params[:recipient_id])
        if recipient.nil?
          return render json: { success: false, error: 'Recipient does not exist' }, status: :bad_request
        end

        if @current_user.user_type == Api::V1::User.find_by(id: message_params[:recipient_id]).user_type
          return render json: { success: false, error: 'Customers can\'t message each other' }, status: :bad_request
        end

        @message = Api::V1::Message.new(message_params.merge(sender_id: @current_user.id, status: false))
        unless @message.save
          return render json: { success: false, data: @message.errors.full_messages[0] }, status: :unprocessable_entity
        end

        Api::V1::NotificationServices.send_notification_to_recipient(@message)
        ActionCable.server.broadcast 'message_channel',
                                     { message: @message.content, sender_id: @message.sender_id,
                                       recipient_id: @message.recipient_id, status: false }
        render json: { success: true, data: @message }, status: :created
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
        params.require(:payload).permit(:recipient_id, :content)
      end
    end
  end
end
