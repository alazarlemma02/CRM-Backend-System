# frozen_string_literal: true

module Api
  module V1
    class ProductQuantityTypesController < ApplicationController
      include Common

      private

      def model_params
        params.require(:payload).permit(:product_quantity_type)
      end
    end
  end
end
