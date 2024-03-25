# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserFeedback, type: :model do
  attributes = [
    { feedback_title: :presence },
    { feedback_content: :presence },
    { feedback_datetime: :presence }
  ]
  include_examples('model_shared_spec', :user_feedback, attributes)
end
