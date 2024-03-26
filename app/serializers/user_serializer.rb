class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :profile_picture, :password_digest, :address_id,
             :role_id, :user_type, :date_of_birth, :user_name
end
