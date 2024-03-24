require 'rails_helper'

RSpec.describe Customer, type: :model do
  attributes = [
    { customer_name: :presence },
    { customer_email: %i[presence uniqueness] }
  ]
  include_examples('model_shared_spec', :customer, attributes)
end
