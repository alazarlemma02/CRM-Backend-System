# frozen_string_literal: true

module Api
  module V1
    class ProductTypesController < ApplicationController
      include Common

      private

      def model_params
        params.require(:payload).permit(:product_type_name)
      end
    end
  end
end
