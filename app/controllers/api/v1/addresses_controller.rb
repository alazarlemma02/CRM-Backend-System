# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController # rubocop:disable Style/Documentation
      include Common
      skip_before_action :authenticate, only: %i[index show]

      private

      def model_params
        params.require(:payload).permit(:region, :city, :state, :postal_code, :country)
      end
    end
  end
end
