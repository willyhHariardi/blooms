module Backyard
  class Ordersontroller < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(Order.all, limit: 10)
    end

    def show
      @order = Order.all
    end
  end
end
