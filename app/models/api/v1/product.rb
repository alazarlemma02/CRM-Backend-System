# frozen_string_literal: true

module Api
  module V1
    class Product < ApplicationRecord
      belongs_to :product_type
      belongs_to :product_category
      belongs_to :product_quantity_type
      validates :product_name, :product_price, :product_quantity_count, presence: true
    end
  end
end
