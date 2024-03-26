class UserFeedbackSerializer < ActiveModel::Serializer
  attributes :id, :feedback_title, :feedback_content, :feedback_datetime, :user_id
end
