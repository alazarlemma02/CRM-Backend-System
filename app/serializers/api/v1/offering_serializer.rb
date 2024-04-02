# frozen_string_literal: true

module Api
  module V1
    class OfferingSerializer < ActiveModel::Serializer
      attributes :id, :offer_title, :offer_description, :offer_start_date, :offer_end_date, :product_id, :offer_type_id
    end
  end
end
