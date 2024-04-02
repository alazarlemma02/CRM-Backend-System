# frozen_string_literal: true

module Api
  module V1
    class OfferTypeSerializer < ActiveModel::Serializer
      attributes :id, :offer_type_name
    end
  end
end
