class CommunicationSerializer < ActiveModel::Serializer
  attributes :id, :communication_type, :communication_datetime, :communication_content, :user_id
end
