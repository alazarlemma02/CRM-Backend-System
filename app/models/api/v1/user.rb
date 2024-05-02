module Api
  module V1
    class User < ApplicationRecord
      enum :user_type, { customer: 0, salesman: 1, admin: 2 }
      has_secure_password
      belongs_to :address
      belongs_to :role
      has_many :user_feedbacks
      has_many :product_feedbacks
      has_many :notifications
      has_one_attached :profile_picture
      has_many :sent_messages, foreign_key: :sender_id, class_name: 'Api::V1::Message'
      has_many :received_messages, foreign_key: :recipient_id, class_name: 'Api::V1::Message'
      validates :first_name, :last_name, :email, :phone_number, :password_digest, :user_name, :address, :role,
                presence: true
      validates :email, :user_name, uniqueness: true
      validates :password_digest, length: { minimum: 6 }
      validates :user_type, presence: true, inclusion: { in: %w[customer salesman admin] }

      def profile_picture_url
        return unless profile_picture.attached?

        Rails.application.routes.url_helpers.rails_blob_url(profile_picture,
                                                            only_path: false)
      end

      def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save!
      end

      def password_token_valid?
        (reset_password_sent_at + 4.hours) > Time.now.utc
      end

      def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
      end

      private

      def generate_token
        SecureRandom.hex(10)
      end
    end
  end
end
