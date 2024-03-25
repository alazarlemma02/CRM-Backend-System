# frozen_string_literal: true

class Communication < ApplicationRecord
  belongs_to :user
  validates :communication_type, :communication_content, :communication_datetime, presence: true
end
