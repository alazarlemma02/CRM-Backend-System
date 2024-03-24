require 'rails_helper'

RSpec.describe Communication, type: :model do
  attributes = [
    { communication_type: :presence },
    { communication_datetime: :presence },
    { communication_content: :presence },
    { customer: :belong_to },
    { salesman: :belong_to }
  ]
  include_examples('model_shared_spec', :communication, attributes)
end