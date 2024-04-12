# frozen_string_literal: true

module Api
  module V1
    class UserFeedbackSerializer < ActiveModel::Serializer
      attributes :id, :feedback_title, :feedback_content, :feedback_datetime, :user_id

      belongs_to :user
    end
  end
end
