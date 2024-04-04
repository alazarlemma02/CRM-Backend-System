# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductFeedback, type: :model do
      attributes = [
        { feedback_content: :presence },
        { user: :belong_to },
        { product: :belong_to }
      ]
      include_examples('model_shared_spec', :product_feedback, attributes)
    end
  end
end
