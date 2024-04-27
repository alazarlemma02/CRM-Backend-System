module Api
  module V1
    class ProductsController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]
      after_action :send_new_product_email, only: %i[create]

      def create
        @product = @clazz.new(model_params)
        super do
          @product
        end
      end

      def show
        super do
          product = Api::V1::Product.with_attached_images.find(params[:id])
          product
        end
      end

      private

      def send_new_product_email
        Api::V1::ProductNotificationService.notify_customers_about_new_product(@product) if @product.present?
      end

      def model_params
        params.require(:payload).permit(:product_name, :product_price, :product_description, :average_rating,
                                        :product_quantity_count, :product_type_id, :product_category_id,
                                        :product_quantity_type_id, product_images: [])
      end
    end
  end
end
