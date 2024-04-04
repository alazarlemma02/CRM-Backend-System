# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe User, type: :model do
      attributes = [
        { first_name: :presence },
        { last_name: :presence },
        { email: %i[presence uniqueness] },
        { phone_number: :presence },
        { password_digest: :presence },
        { user_name: :presence },
        { address: %i[presence belong_to] },
        { role: %i[presence belong_to] },
        { user_type: :presence },
        { user_feedbacks: :have_many },
        { communications: :have_many },
        { product_feedbacks: :have_many }

      ]
      include_examples('model_shared_spec', :user, attributes)
      it { should define_enum_for(:user_type).with_values(%i[customer salesman]) }
      it { should validate_length_of(:password_digest).is_at_least(6) }
    end
  end
end
