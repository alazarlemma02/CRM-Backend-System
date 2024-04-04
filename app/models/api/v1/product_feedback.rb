# frozen_string_literal: true

module Api
  module V1
    class ProductFeedback < ApplicationRecord
      belongs_to :user
      belongs_to :product
      validates :feedback_content, :product_rating, presence: true
      validates :user_id,
                uniqueness: { scope: :product_id, message: 'You have already given feedback for this product' }
      after_save :update_product_average_rating
      after_destroy :update_product_average_rating

      private

      def update_product_average_rating
        product.update(average_rating: product.product_feedbacks.average(:product_rating).to_f.round(2))
      end
    end
  end
end
