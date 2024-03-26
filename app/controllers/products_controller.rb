# frozen_string_literal: true

class ProductsController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:product_name, :product_price, :product_rating, :product_description,
                                    :product_image, :product_quantity_count, :product_type_id, :product_category_id,
                                    :product_quantity_type_id)
  end
end
