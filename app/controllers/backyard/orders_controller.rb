module Backyard
  class OrdersController < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(Order.not_draft_orders, limit: 10)
    end

    def edit
      @order = Order.find(params[:id])
    end

    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
        redirect_to backyard_orders_path, notice: 'Order was successfully updated.'
      else
        render :edit
      end
    end 

    def show
      @order = Order.all
    end

    private

    def order_params  
      params.require(:order_form).permit(:status)
    end 
  end
end
