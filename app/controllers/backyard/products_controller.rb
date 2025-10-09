module Backyard
  class ProductsController < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(Product.all, limit: 10)
    end

    def new
      @category = Product.new
    end

    def edit
      @category = Product.find(params[:id])
    end

    
    def update
      @category = Product.find(params[:id])
      if @category.update(room_params)
        redirect_to backyard_category_products_path
      else
        render 'edit'
      end
    end


    def create
      @category = Product.new(room_params)
      if @category.save
        redirect_to backyard_category_products_path
      else
        return render 'new'
      end
    end

  
    def room_params
      permitted = params.require(:roduct_form)
            .permit(:title, :category_product_id, :price, :description, :image)
      
    end
  end
end
