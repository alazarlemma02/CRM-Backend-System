# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  attributes = [
    { product_category_name: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :product_category, attributes)
end
