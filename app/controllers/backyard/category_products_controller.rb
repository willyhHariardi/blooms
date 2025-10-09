module Backyard
  class CategoryProductsController < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(CategoryProduct.all, limit: 10)
    end

    def new
      @category = CategoryProduct.new
    end

    def edit
      @category = CategoryProduct.find(params[:id])
    end

    
    def update
      @category = CategoryProduct.find(params[:id])
      if @category.update(room_params)
        redirect_to backyard_category_products_path
      else
        render 'edit'
      end
    end


    def create
      @category = CategoryProduct.new(room_params)
      if @category.save
        redirect_to backyard_category_products_path
      else
        return render 'new'
      end
    end

  
    def room_params
      permitted = params.require(:category_product_form)
            .permit(:title)
      
    end
  end
end
