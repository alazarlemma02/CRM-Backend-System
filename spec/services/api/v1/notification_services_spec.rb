# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe 'Notification Services', type: :service do
      describe '#send_notification_to_recipient' do
        let(:recipient) { create(:user) }
        let(:sender) { create(:user) }
        let!(:message) { create(:message, recipient:, sender:) }

        it 'creates a notification for the recipient user' do
          expect do
            Api::V1::NotificationServices.send_notification_to_recipient(message)
          end.to change { recipient.notifications.count }.by(1)

          notification = recipient.notifications.last
          expect(notification.user_id).to eq(recipient.id)
          expect(notification.message_id).to eq(message.id)
        end

        it 'does not create a notification for the sender user' do
          expect do
            Api::V1::NotificationServices.send_notification_to_recipient(message)
          end.not_to change { sender.notifications.count }.from(0)

          expect(sender.notifications).to be_empty
        end
      end
    end
  end
end
