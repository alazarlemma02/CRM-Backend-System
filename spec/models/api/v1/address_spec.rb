require 'rails_helper'

module Api
  module V1
    RSpec.describe Address, type: :model do
      attributes = [
        { region: :presence },
        { city: :presence },
        { country: :presence },
        { users: :have_many }
      ]
      include_examples('model_shared_spec', :address, attributes)
    end
  end
end
