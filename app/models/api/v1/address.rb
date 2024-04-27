module Api
  module V1
    class Address < ApplicationRecord
      has_many :users
      validates :region, :city, :country, presence: true
    end
  end
end
