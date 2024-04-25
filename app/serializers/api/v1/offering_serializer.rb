module Api
  module V1
    class OfferingSerializer < ActiveModel::Serializer
      attributes :id, :offer_title, :offer_description, :offer_start_date, :offer_end_date

      belongs_to :product
      belongs_to :offer_type
    end
  end
end
