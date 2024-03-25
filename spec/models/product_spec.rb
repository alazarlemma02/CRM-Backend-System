# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  attributes = [
    { product_name: :presence },
    { product_price: :presence },
    { product_quantity_count: :presence },
    { product_type: :belong_to },
    { product_category: :belong_to },
    { product_quantity_type: :belong_to }
  ]
  include_examples('model_shared_spec', :product, attributes)
end
