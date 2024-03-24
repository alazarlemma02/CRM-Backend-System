class Salesman < ApplicationRecord
  has_secure_password
  belongs_to :address
  belongs_to :role
  validates :salesman_name, :salesman_email, :password_digest, presence: true
  validates :salesman_email, uniqueness: true
end
