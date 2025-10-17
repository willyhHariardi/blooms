class Product < ApplicationRecord
  belongs_to :category_product
  has_one_attached :display_image
  has_many :carts, dependent: :destroy
  has_many :sub_products, dependent: :destroy

  accepts_nested_attributes_for :sub_products, allow_destroy: true
  
  scope :pending_orders, -> { 
    joins(:order).where(orders: { status: 'pending' }) 
  }

  has_many :sub_booking_rooms, dependent: :destroy

  def display_image_url
    return Rails.application.routes.url_helpers.rails_blob_url(display_image) if display_image.attached?
    ''
  end
end