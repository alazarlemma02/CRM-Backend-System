module Api
  module V1
    class ProductQuantityTypesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]

      private

      def model_params
        params.require(:payload).permit(:product_quantity_type)
      end
    end
  end
end
