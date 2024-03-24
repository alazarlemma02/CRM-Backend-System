class Role < ApplicationRecord
    validates :role_name, presence: true, uniqueness: true
end
