# frozen_string_literal: true

module Api
  module V1
    class ProductFeedback < ApplicationRecord
      belongs_to :user
      belongs_to :product
      validates :feedback_content, presence: true
    end
  end
end
