# frozen_string_literal: true

class ProductQuantityType < ApplicationRecord
  validates :product_quantity_type, presence: true, uniqueness: true
end
