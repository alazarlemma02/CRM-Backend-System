require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductCategory, type: :model do
      attributes = [
        { product_category_name: %i[presence uniqueness] },
        { products: :have_many }
      ]
      include_examples('model_shared_spec', :product_category, attributes)
    end
  end
end
