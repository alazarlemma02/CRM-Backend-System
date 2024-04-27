module Api
  module V1
    class ProductCategorySerializer < ActiveModel::Serializer
      attributes :id, :product_category_name
    end
  end
end
