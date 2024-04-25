module Api
  module V1
    class ProductSerializer < ActiveModel::Serializer
      attributes :id, :product_name, :product_price, :product_description, :average_rating,
                 :product_quantity_count, :product_images_url

      belongs_to :product_type
      belongs_to :product_category
      belongs_to :product_quantity_type
    end
  end
end
