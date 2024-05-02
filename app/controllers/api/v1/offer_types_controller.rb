module Api
  module V1
    class OfferTypesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[index show]
      before_action :authorize_salesman, only: %i[create update destroy]

      private

      def model_params
        params.require(:payload).permit(:offer_type_name)
      end
    end
  end
end
