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
      @product.sub_products.build if @product.sub_products.empty?
    end

    def edit
      @product = Product.find(params[:id])
      @categories = CategoryProduct.all
      @product.sub_products.build if @product.sub_products.empty?
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
            .permit(:title, :category_product_id, :description, :display_image,  sub_products_attributes: [:id, :name, :price, :_destroy])
      
    end
  end
end
