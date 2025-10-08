module Backyard
  class AdminController < ApplicationController
    before_action :authenticate_admin!

    def index
       @pagy, @records = pagy(Admin.all, limit: 10)
    end

    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        redirect_to backyard_admin_index_path
      else
        return render 'new'
      end
    end

    def destroy
      @admin = Admin.find_by(id: params[:id])
      @admin.destroy
      redirect_to backyard_admin_index_path
    end

    private

    def default_params
      params[:limit] ||= 25
    end

    def admin_params
      permitted = params.require(:admin)
      .permit(:name, :password, :email, :status)
    end
    
  end
end
