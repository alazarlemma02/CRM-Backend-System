# frozen_string_literal: true

module Api
  module V1
    class MessagesController < Api::V1::ApplicationController
      before_action :set_message, only: %i[show update destroy]

      def index
        @messages = Api::V1::Message.all
        render json: @messages
      end

      def show
        render json: @message
      end

      def create
        @message = Api::V1::Message.new(message_params)
        if @message.save
          ActionCable.server.broadcast 'message_channel', { message: @message.content, sender_id: @message.sender_id,
                                                            recipient_id: @message.recipient_id, status: false }
          render json: @message, status: :created
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end

      def update
        if @message.update(message_params)
          render json: @message
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @message.destroy
        render json: { message: 'Message deleted' }
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
