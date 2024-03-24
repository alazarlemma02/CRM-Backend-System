class Communication < ApplicationRecord
  belongs_to :customer
  belongs_to :salesman
  validates :communication_type, :communication_content, :communication_datetime, presence: true
end
