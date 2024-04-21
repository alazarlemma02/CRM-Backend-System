# frozen_string_literal: true

module Api
  module V1
    class NotificationSerializer < ActiveModel::Serializer
      attributes :id, :user_id, :message_id, :created_at

      belongs_to :user, class_name: 'Api::V1::User'
      belongs_to :message, class_name: 'Api::V1::Message'
    end
  end
end
