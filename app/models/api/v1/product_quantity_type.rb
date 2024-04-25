module Api
  module V1
    class ProductQuantityType < ApplicationRecord
      validates :product_quantity_type, presence: true, uniqueness: true
      has_many :products
    end
  end
end
