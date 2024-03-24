class OfferType < ApplicationRecord
    validates :offer_type_name, presence: true, uniqueness: true
    has_many :offers
end
