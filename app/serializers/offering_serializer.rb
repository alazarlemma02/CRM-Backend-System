class OfferingSerializer < ActiveModel::Serializer
  attributes :id, :offer_title, :offer_description, :offer_start_date, :offer_end_date, :product_id, :offer_type_id
end
