class CustomerFeedback < ApplicationRecord
  belongs_to :customer
  validates :feedback_title, :feedback_comment, :feedback_datetime, presence: true
end
