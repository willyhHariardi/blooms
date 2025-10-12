class CartsController < ApplicationController
  def index
    @cart_items = current_user.carts.includes(:product)
    @total_price = @cart_items.sum { |cart| cart.product.price * cart.quantity }    
    
  end

  def show

  end
end
