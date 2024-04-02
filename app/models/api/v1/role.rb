# frozen_string_literal: true

module Api
  module V1
    class Role < ApplicationRecord
      has_many :users
      validates :role_name, presence: true, uniqueness: true
    end
  end
end
