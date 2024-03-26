# frozen_string_literal: true

class ProductQuantityTypesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:product_quantity_type)
  end
end
