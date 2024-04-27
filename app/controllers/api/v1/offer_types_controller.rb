module Api
  module V1
    class OfferTypesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[index show]

      private

      def model_params
        params.require(:payload).permit(:offer_type_name)
      end
    end
  end
end
