module Backyard
  class UsersController < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(User.all, limit: 10)
    end

    def show
      @user = User.find(params[:id])
      @pagy, @records = pagy( @user.orders.not_draft_orders, limit: 10)
    end 
  end
end
