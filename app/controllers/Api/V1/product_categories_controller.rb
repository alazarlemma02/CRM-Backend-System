# frozen_string_literal: true

module Api
  module V1
    class ProductCategoriesController < ApplicationController
      include Common

      private

      def model_params
        params.require(:payload).permit(:product_category_name)
      end
    end
  end
end
