# frozen_string_literal: true

module Api
  module V1
    class CommunicationSerializer < ActiveModel::Serializer
      attributes :id, :communication_type, :communication_datetime, :communication_content, :user_id
    end
  end
end
