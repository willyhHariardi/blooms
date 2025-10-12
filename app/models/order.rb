class Order < ApplicationRecord
  has_many :carts, dependent: :destroy

end