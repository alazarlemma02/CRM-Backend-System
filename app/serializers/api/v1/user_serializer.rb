# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :phone_number, :address_id,
                 :role_id, :user_type, :date_of_birth, :user_name, :profile_picture_url

      belongs_to :address
      belongs_to :role
      has_many :sent_messages, key: :sent_messages, class_name: 'Api::V1::Message'
      has_many :received_messages, key: :received_messages, class_name: 'Api::V1::Message'
    end
  end
end
