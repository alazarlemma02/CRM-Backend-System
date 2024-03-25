# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offering, type: :model do
  attributes = [
    { offer_title: :presence },
    { offer_description: :presence },
    { offer_start_date: :presence },
    { offer_end_date: :presence },
    { product: :belong_to },
    { offer_type: :belong_to }
  ]
  include_examples('model_shared_spec', :offering, attributes)
end
