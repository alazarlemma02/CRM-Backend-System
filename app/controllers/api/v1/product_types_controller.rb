module Api
  module V1
    class ProductTypesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]

      private

      def model_params
        params.require(:payload).permit(:product_type_name)
      end
    end
  end
end
