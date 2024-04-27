module Api
  module V1
    class RoleSerializer < ActiveModel::Serializer
      attributes :id, :role_name
    end
  end
end
