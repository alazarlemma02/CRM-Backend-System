# frozen_string_literal: true

module Api
  module V1
    class Message < ApplicationRecord
      belongs_to :sender, class_name: 'Api::V1::User'
      belongs_to :recipient, class_name: 'Api::V1::User'

      validates :content, :sender, :recipient, presence: true
      after_create :send_notification_to_recipient, if: :unread?

      private

      def unread?
        status
      end

      def send_notification_to_recipient
        recipient.notifications.create(user: recipient, message: self)
      end
    end
  end
end
