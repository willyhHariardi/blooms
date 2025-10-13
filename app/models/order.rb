class Order < ApplicationRecord
  has_many :carts, dependent: :destroy
  belongs_to :user
  enum :status, { draft: 'draft', pending: 'pending', paid: 'paid', completed: 'completed', cancelled: 'cancelled' }

  scope :paid_orders, -> { 
    where(orders: { status: 'paid' }) 
  }
  scope :not_draft_orders, -> { where.not(status: 'draft') }
end