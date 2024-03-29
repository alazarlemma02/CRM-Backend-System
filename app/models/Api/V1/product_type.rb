# frozen_string_literal: true

module Api
  module V1
    class ProductType < ApplicationRecord
      validates :product_type_name, presence: true, uniqueness: true
      has_many :products
    end
  end
end
