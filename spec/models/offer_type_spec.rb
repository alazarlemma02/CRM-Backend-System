# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferType, type: :model do
  attributes = [
    { offer_type_name: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :offer_type, attributes)
end
