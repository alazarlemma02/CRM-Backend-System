# frozen_string_literal: true

module Api
  module V1
    class User < ApplicationRecord
      enum :user_type, { customer: 0, salesman: 1 }
      has_secure_password
      belongs_to :address
      belongs_to :role
      has_many :user_feedbacks
      has_many :product_feedbacks
      has_one_attached :profile_picture
      has_many :sent_messages, foreign_key: :sender_id, class_name: 'Api::V1::Message'
      has_many :received_messages, foreign_key: :recipient_id, class_name: 'Api::V1::Message'
      validates :first_name, :last_name, :email, :phone_number, :password_digest, :user_name, :address, :role,
                presence: true
      validates :email, :user_name, uniqueness: true
      validates :password_digest, length: { minimum: 6 }
      validates :user_type, presence: true, inclusion: { in: %w[customer salesman] }

      def profile_picture_url
        return unless profile_picture.attached?

        Rails.application.routes.url_helpers.rails_blob_url(profile_picture,
                                                            only_path: false)
      end
    end
  end
end
