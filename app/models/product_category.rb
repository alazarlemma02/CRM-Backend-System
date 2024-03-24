class ProductCategory < ApplicationRecord
    validates :product_category_name, presence: true, uniqueness: true
    has_many :products
end
