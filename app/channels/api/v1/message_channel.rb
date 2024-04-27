module Api
  module V1
    class MessageChannel < ApplicationCable::Channel
      def subscribed
        # stream_from "some_channel"
        stream_from 'message_channel'
      end

      def unsubscribed
        # Any cleanup needed when channel is unsubscribed
      end

      def speak(data)
        message = Api::V1::Message.create!(content: data['message'], sender_id: data['sender_id'],
                                           recipient_id: data['recipient_id'])
        ActionCable.server.broadcast 'message_channel', message: message.content, sender_id: message.sender_id,
                                                        recipient_id: message.recipient_id
      end
    end
  end
end
