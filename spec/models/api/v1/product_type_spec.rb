require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductType, type: :model do
      attributes = [
        { product_type_name: %i[presence uniqueness] },
        { products: :have_many }
      ]
      include_examples('model_shared_spec', :product_type, attributes)
    end
  end
end
