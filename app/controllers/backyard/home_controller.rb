module Backyard
  class HomeController < ApplicationController
    before_action :authenticate_admin!

    layout 'backyard/application'
    
    def index
      @total_orders = Order.not_draft_orders.count
      @total_users = User.count
      ids = Order.includes(:user).where.not(status: 'draft').order(created_at: :desc).pluck(:user_id).uniq
      @users = User.where(id: ids).index_by(&:id)
    end
  end
end
