module Api
  module V1
    class ProductCategoriesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[show index]
      before_action :authorize_salesman, only: %i[create update destroy]

      private

      def model_params
        params.require(:payload).permit(:product_category_name)
      end
    end
  end
end
