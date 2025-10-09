class CategoryProduct < ApplicationRecord
  has_many :products, dependent: :destroy
end