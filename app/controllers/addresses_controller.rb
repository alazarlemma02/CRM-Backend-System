# frozen_string_literal: true

class AddressesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:region, :city, :state, :postal_code, :country)
  end
end
