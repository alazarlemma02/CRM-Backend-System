# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]

      private

      def model_params
        params.require(:payload).permit(:product_name, :product_price, :product_description, :average_rating,
                                        :product_image, :product_quantity_count, :product_type_id, :product_category_id,
                                        :product_quantity_type_id)
      end
    end
  end
end
