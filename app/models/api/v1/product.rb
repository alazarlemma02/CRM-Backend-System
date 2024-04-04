# frozen_string_literal: true

module Api
  module V1
    class Product < ApplicationRecord
      belongs_to :product_type
      belongs_to :product_category
      belongs_to :product_quantity_type
      has_many :product_feedbacks
      validates :product_name, :product_price, :product_quantity_count, :average_rating, presence: true
    end
  end
end
