# frozen_string_literal: true

module Api
  module V1
    class ProductFeedbacksController < ApplicationController
      skip_before_action :authenticate, only: %i[index]
      include Common

      private

      def model_params
        params.require(:payload).permit(:feedback_content, :user_id, :product_id)
      end
    end
  end
end
