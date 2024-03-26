# frozen_string_literal: true

class OfferTypesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:offer_type_name)
  end
end
