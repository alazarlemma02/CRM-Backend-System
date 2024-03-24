require 'rails_helper'

RSpec.describe CustomerFeedback, type: :model do
  attributes = [
    { feedback_title: :presence },
    { feedback_comment: :presence },
    { feedback_datetime: :presence },
    { customer: :belong_to }
  ]
  include_examples('model_shared_spec', :customer_feedback, attributes)
end