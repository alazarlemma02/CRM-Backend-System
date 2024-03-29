# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  attributes = [
    { first_name: :presence },
    { last_name: :presence },
    { email: %i[presence uniqueness] },
    { phone_number: :presence },
    { password_digest: :presence },
    { user_name: :presence },
    { address: :presence },
    { role: :presence },
    { user_type: :presence }
  ]
  include_examples('model_shared_spec', :user, attributes)
  it { should define_enum_for(:user_type).with_values(%i[customer salesman]) }
  it { should validate_length_of(:password_digest).is_at_least(6) }
end
