class Product < ApplicationRecord
  belongs_to :category_product
  has_one_attached :image
  has_many :carts, dependent: :destroy
end