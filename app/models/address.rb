# frozen_string_literal: true

class Address < ApplicationRecord
  validates :region, :city, :country, presence: true
end
