require 'rails_helper'

RSpec.describe ProductQuantityType, type: :model do
  attributes = [
    { product_quantity_type: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :product_quantity_type, attributes)
end
