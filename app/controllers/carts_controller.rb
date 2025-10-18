class CartsController < ApplicationController
  def index
    @cart_items = current_user.carts.draft_orders.includes(:sub_product)
    @total_price = @cart_items.sum { |cart| cart.sub_product.price * cart.quantity }    
    
  end

   def create
    @product = SubProduct.find(params[:sub_product_id])
    quantity = params[:quantity].to_i
    
    # Cari atau buat draft order untuk user
    order = current_user.orders.find_or_create_by(status: 'draft')
    
    # Cek apakah produk sudah ada di cart
    cart_item = order.carts.find_by(sub_product_id: @product.id)
    
    if cart_item
      # Jika sudah ada, tambah quantity
      cart_item.update(quantity: cart_item.quantity + quantity)
    else
      # Jika belum ada, buat cart baru
      cart_item = order.carts.create(
        user: current_user,
        sub_product: @product,
        quantity: quantity
      )
    end
    
    if cart_item.persisted?
      redirect_to carts_path, notice: 'Product added to cart successfully!'
    else
      redirect_to product_path(@product.product), alert: 'Failed to add product to cart.'
    end
  end

  def checkout
    @order = current_user.orders.find_by(status: 'draft')
    
    if @order.blank? || @order.carts.empty?
      redirect_to carts_path, alert: 'Cart is empty'
      return
    end
    
    # Update order dengan data billing
    @order.update(
      deliver_name: params[:customer_name],
      address: params[:customer_address],
      phone_number: params[:customer_phone],
      total_amount: params[:total_price].to_f,
      status: 'pending',
      order_date: Time.current
    )
    
    if @order.save
      # Redirect ke halaman success atau kirim ke WhatsApp
      redirect_to backyard_orders_path, notice: 'Order placed successfully!'
    else
      redirect_to carts_path, alert: 'Failed to place order'
    end
  end
  
  
  def update
    @cart_item = Cart.find(params[:id])
    
    if @cart_item.update(quantity: params[:quantity])
      render json: { success: true, message: 'Quantity updated' }
    else
      render json: { success: false, message: 'Failed to update' }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cart_item = Cart.find(params[:id])
    
    if @cart_item.destroy
      redirect_to carts_path, notice: 'Item removed from cart'
    else
      redirect_to carts_path, alert: 'Failed to remove item'
    end
  end
end
