# frozen_string_literal: true

module Api
  module V1
    class Communication < ApplicationRecord
      belongs_to :user
      validates :communication_type, :communication_content, :communication_datetime, presence: true
    end
  end
end
