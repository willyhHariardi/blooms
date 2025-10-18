class SubProduct < ApplicationRecord
  belongs_to :product, dependent: :destroy
  has_many :carts, dependent: :destroy
  
end