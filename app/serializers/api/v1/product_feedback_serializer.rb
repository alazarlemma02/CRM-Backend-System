# frozen_string_literal: true

module Api
  module V1
    class ProductFeedbackSerializer < ActiveModel::Serializer
      attributes :id, :feedback_content, :user_id, :product_id, :product_rating
    end
  end
end
