# frozen_string_literal: true

module Api
  module V1
    class User < ApplicationRecord
      enum :user_type, { customer: 0, salesman: 1 }
      has_secure_password
      belongs_to :address
      belongs_to :role
      has_many :user_feedbacks
      has_many :communications
      validates :first_name, :last_name, :email, :phone_number, :password_digest, :user_name, :address, :role,
                presence: true
      validates :email, :user_name, uniqueness: true
      validates :password_digest, length: { minimum: 6 }
      validates :user_type, presence: true, inclusion: { in: %w[customer salesman] }
    end
  end
end
