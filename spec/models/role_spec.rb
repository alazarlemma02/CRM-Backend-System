# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  attributes = [
    { role_name: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :role, attributes)
end
