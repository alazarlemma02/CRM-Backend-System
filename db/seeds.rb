# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Api::V1::User.create!(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@test.com',
  phone_number: '123456',
  password: 'password',
  address_id: 1,
  role_id: 1,
  date_of_birth: '2000-01-01',
  user_name: 'admin01',
  user_type: 2
)
