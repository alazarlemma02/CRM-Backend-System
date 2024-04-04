# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe Product, type: :model do
      attributes = [
        { product_name: :presence },
        { product_price: :presence },
        { product_quantity_count: :presence },
        { average_rating: :presence },
        { product_type: :belong_to },
        { product_category: :belong_to },
        { product_quantity_type: :belong_to },
        { product_feedbacks: :have_many }
      ]
      include_examples('model_shared_spec', :product, attributes)
    end
  end
end
