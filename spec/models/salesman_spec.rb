require 'rails_helper'

RSpec.describe Salesman, type: :model do
  attributes = [
    { salesman_name: :presence },
    { salesman_email: [:presence, :uniqueness] },
    { password_digest: :presence },
    { address: :belong_to },
    { role: :belong_to }
  ]
  include_examples('model_shared_spec', :salesman, attributes)
end
