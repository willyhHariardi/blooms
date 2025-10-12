class Product < ApplicationRecord
  belongs_to :category_product
  has_one_attached :display_image
  has_many :carts, dependent: :destroy

  def display_image_url
    return Rails.application.routes.url_helpers.rails_blob_url(display_image) if display_image.attached?
    ''
  end
end