class OrderController < ApplicationController
  def index
    @orders = current_user.orders.where.not(status: 'draft').order(created_at: :desc)
  end

  def show
    @orders = current_user.orders.whe
  end
end
