# frozen_string_literal: true

module Api
  module V1
    class OfferType < ApplicationRecord
      validates :offer_type_name, presence: true, uniqueness: true
      has_many :offerings
    end
  end
end
