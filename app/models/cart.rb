class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order
  
  scope :pending_orders, -> { 
    joins(:order).where(orders: { status: 'pending' }) 
  }

   scope :draft_orders, -> { 
    joins(:order).where(orders: { status: 'draft' }) 
  }
  
end