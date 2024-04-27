require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductQuantityType, type: :model do
      attributes = [
        { product_quantity_type: %i[presence uniqueness] },
        { products: :have_many }
      ]
      include_examples('model_shared_spec', :product_quantity_type, attributes)
    end
  end
end
