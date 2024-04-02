# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :phone_number, :profile_picture, :address_id,
                 :role_id, :user_type, :date_of_birth, :user_name
    end
  end
end
