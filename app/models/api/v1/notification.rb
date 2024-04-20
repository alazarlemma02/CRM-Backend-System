# frozen_string_literal: true

module Api
  module V1
    class Notification < ApplicationRecord
      belongs_to :user
      belongs_to :message

      validates :user_id, :message_id, presence: true
      validates :message_id, uniqueness: { scope: :user_id }
    end
  end
end
