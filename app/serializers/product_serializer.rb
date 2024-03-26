class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_price, :product_rating, :product_description, :product_image,
             :product_quantity_count, :product_type_id, :product_category_id, :product_quantity_type_id
end
