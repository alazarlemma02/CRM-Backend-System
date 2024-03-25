# frozen_string_literal: true

class UserFeedback < ApplicationRecord
  belongs_to :user
  validates :feedback_title, :feedback_content, :feedback_datetime, presence: true
end
