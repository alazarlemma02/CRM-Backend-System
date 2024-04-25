module Api
  module V1
    class Product < ApplicationRecord
      belongs_to :product_type
      belongs_to :product_category
      belongs_to :product_quantity_type
      has_many :product_feedbacks
      has_many_attached :product_images
      validates :product_name, :product_price, :product_quantity_count, :average_rating, presence: true

      def product_images_url
        if product_images.attached?
          product_images.map do |image|
            Rails.application.routes.url_helpers.rails_blob_url(image,
                                                                only_path: false)
          end
        else
          []
        end
      end
    end
  end
end
