# frozen_string_literal: true

module Api
  module V1
    class Message < ApplicationRecord
      belongs_to :sender, class_name: 'Api::V1::User'
      belongs_to :recipient, class_name: 'Api::V1::User'

      validates :content, :sender, :recipient, presence: true
    end
  end
end