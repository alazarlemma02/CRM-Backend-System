# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe OfferType, type: :model do
      attributes = [
        { offer_type_name: %i[presence uniqueness] },
        { offerings: :have_many }
      ]
      include_examples('model_shared_spec', :offer_type, attributes)
    end
  end
end
