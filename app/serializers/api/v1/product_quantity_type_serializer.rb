module Api
  module V1
    class ProductQuantityTypeSerializer < ActiveModel::Serializer
      attributes :id, :product_quantity_type
    end
  end
end
