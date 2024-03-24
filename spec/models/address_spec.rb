require 'rails_helper'

RSpec.describe Address, type: :model do
  attributes = [
    { region: :presence },
    { city: :presence },
    { country: :presence }
  ]
  include_examples('model_shared_spec', :address, attributes)
end
