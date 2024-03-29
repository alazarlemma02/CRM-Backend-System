# frozen_string_literal: true

module Api
  module V1
    class AddressSerializer < ActiveModel::Serializer
      attributes :id, :region, :city, :state, :postal_code, :country
    end
  end
end
