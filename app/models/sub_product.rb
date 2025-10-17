class SubProduct < ApplicationRecord
  has_many :product, dependent: :destroy
  has_many :carts, dependent: :destroy
  
end