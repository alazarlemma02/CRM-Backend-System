# frozen_string_literal: true

module Api
  module V1
    class UserFeedback < ApplicationRecord
      belongs_to :user
      validates :feedback_title, :feedback_content, :feedback_datetime, presence: true
    end
  end
end
