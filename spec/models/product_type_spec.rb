# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductType, type: :model do
  attributes = [
    { product_type_name: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :product_type, attributes)
end
