require 'rails_helper'

module Api
  module V1
    RSpec.describe Role, type: :model do
      attributes = [
        { role_name: %i[presence uniqueness] },
        { users: :have_many }
      ]
      include_examples('model_shared_spec', :role, attributes)
    end
  end
end
