# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]

      def show
        super do
          product = Api::V1::Product.with_attached_images.find(params[:id])
          product
        end
      end

      private

      def model_params
        params.require(:payload).permit(:product_name, :product_price, :product_description, :average_rating,
                                        :product_quantity_count, :product_type_id, :product_category_id,
                                        :product_quantity_type_id, product_images: [])
      end
    end
  end
end
