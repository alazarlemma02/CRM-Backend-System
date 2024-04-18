# frozen_string_literal: true

module Api
  module V1
    module EmailNotifier
      extend ActiveSupport::Concern

      included do
        after_action :send_email, only: %i[create]
      end

      private

      def send_email
        Api::V1::UserMailer.welcome_email(@obj).deliver_now if @obj.present?
      end
    end
  end
end
