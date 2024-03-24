class Offering < ApplicationRecord
  belongs_to :product
  belongs_to :offer_type
  validates :offer_title, :offer_description, :offer_start_date, :offer_end_date, presence: true
end
