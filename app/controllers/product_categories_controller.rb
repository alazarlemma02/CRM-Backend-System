# frozen_string_literal: true

class ProductCategoriesController < ApplicationController # rubocop:disable Style/Documentation
  include Common

  private

  def model_params
    params.require(:payload).permit(:product_category_name)
  end
end
