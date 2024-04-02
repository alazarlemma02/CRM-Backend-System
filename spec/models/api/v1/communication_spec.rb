# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe Communication, type: :model do
      attributes = [
        { communication_type: :presence },
        { communication_datetime: :presence },
        { communication_content: :presence },
        { user: :belong_to }
      ]
      include_examples('model_shared_spec', :communication, attributes)
    end
  end
end
