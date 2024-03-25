# frozen_string_literal: true

class User < ApplicationRecord
  enum :user_type, { customer: 0, salesman: 1 }

  has_secure_password
  belongs_to :address
  belongs_to :role
  validates :first_name, :last_name, :email, :phone_number, :password_digest, :user_name, :user_type, :address, :role,
            presence: true
  validates :email, :user_name, uniqueness: true
end
