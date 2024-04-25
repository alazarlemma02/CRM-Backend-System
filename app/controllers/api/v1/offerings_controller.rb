module Api
  module V1
    class OfferingsController < ApplicationController
      include Common
      skip_before_action :authenticate, only: %i[index show]
      after_action :send_new_offering_email, only: %i[create]

      def create
        @offering = @clazz.new(model_params)
        super do
          @offering
        end
      end

      private

      def send_new_offering_email
        Api::V1::OfferingsNotificationService.notify_customers_about_new_offering(@offering) if @offering.present?
      end

      def model_params
        params.require(:payload).permit(:offer_title, :offer_description, :offer_start_date, :offer_end_date,
                                        :product_id, :offer_type_id)
      end
    end
  end
end
