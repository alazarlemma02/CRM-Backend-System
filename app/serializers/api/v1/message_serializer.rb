# frozen_string_literal: true

module Api
  module V1
    class MessageSerializer < ActiveModel::Serializer
      attributes :id, :content, :sender_id, :recipient_id, :status, :created_at, :updated_at

      belongs_to :sender, class_name: 'Api::V1::User'
      belongs_to :recipient, class_name: 'Api::V1::User'
    end
  end
end
