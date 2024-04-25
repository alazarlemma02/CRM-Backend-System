require 'rails_helper'

module Api
  module V1
    RSpec.describe Message, type: :model do
      attributes = [
        { sender: %i[belong_to presence] },
        { recipient: %i[belong_to presence] },
        { content: :presence }

      ]
      include_examples('model_shared_spec', :message, attributes)
    end
  end
end
