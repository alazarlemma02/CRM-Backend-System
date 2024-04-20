# frozen_string_literal: true

module Api
  module V1
    class NotificationServices
      def self.send_notification_to_recipient(message)
        recipient = message.recipient
        notification = Api::V1::Notification.find_or_initialize_by(user: recipient, message:)
        notification.save unless notification.persisted?
      end
    end
  end
end
