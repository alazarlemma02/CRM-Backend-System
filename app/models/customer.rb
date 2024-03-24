class Customer < ApplicationRecord
  has_secure_password
  belongs_to :address
  belongs_to :role
  validates :customer_name, :customer_email, :password_digest, presence: true
  validates :customer_email, uniqueness: true
end
