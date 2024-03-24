class Address < ApplicationRecord
    validates :region, :city, :country, presence: true
end
