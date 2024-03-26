# frozen_string_literal: true

class OfferingsController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:offer_title, :offer_description, :offer_start_date, :offer_end_date,
                                    :product_id, :offer_type_id)
  end
end
