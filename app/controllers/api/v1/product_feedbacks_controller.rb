module Api
  module V1
    class ProductFeedbacksController < ApplicationController
      skip_before_action :authenticate, only: %i[index]
      include Common

      def index
        super do
          @product = Api::V1::Product.find(params[:product_id])
          @product.product_feedbacks
        end
      end

      private

      def model_params
        params.require(:payload).permit(:feedback_content, :user_id, :product_id, :product_rating)
      end
    end
  end
end
