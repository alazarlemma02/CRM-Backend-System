# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe Notification, type: :model do
      attributes = [
        { user: %i[belong_to] },
        { message: %i[belong_to] },
        { user_id: %i[presence] },
        { message_id: %i[presence] }
      ]
      include_examples('model_shared_spec', :notification, attributes)

      describe 'validations' do
        it { is_expected.to validate_uniqueness_of(:message_id).scoped_to(:user_id) }
      end
    end
  end
end
