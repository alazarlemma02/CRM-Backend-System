# frozen_string_literal: true

class ProductTypesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:product_type_name)
  end
end
