module Backyard
  class ProductsController < ApplicationController
    before_action :authenticate_admin!
    layout 'backyard/application'
    
    def index
      @pagy, @records = pagy(Product.all, limit: 10)
    end

    def new

      @categories = CategoryProduct.all
      @product = Product.new
    end

    def edit
      @product = Product.find(params[:id])
      @categories = CategoryProduct.all
    end

    
    def update
      @categories = CategoryProduct.all
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to backyard_products_path
      else
        render 'edit'
      end
    end


    def create
    @categories = CategoryProduct.all
      @product = Product.new(product_params)
      if @product.save
        redirect_to backyard_products_path
      else
        return render 'new'
      end
    end

  
    def product_params
      permitted = params.require(:product_form)
            .permit(:title, :category_product_id, :price, :description, :display_image)
      
    end
  end
end
