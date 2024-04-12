# frozen_string_literal: true

module Api
  module V1
    class ProductTypeSerializer < ActiveModel::Serializer
      attributes :id, :product_type_name
    end
  end
end
