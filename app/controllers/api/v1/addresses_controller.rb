module Api
  module V1
    class AddressesController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[create index show]

      private

      def model_params
        params.require(:payload).permit(:region, :city, :state, :postal_code, :country)
      end
    end
  end
end
