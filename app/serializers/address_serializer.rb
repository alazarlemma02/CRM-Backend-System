class AddressSerializer < ActiveModel::Serializer
  attributes :id, :region, :city, :state, :postal_code, :country
end
