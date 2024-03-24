class ProductType < ApplicationRecord
    validates :product_type_name, presence: true, uniqueness: true
    has_many :products
end