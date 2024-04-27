module Api
  module V1
    class ProductCategory < ApplicationRecord
      validates :product_category_name, presence: true, uniqueness: true
      has_many :products
    end
  end
end
