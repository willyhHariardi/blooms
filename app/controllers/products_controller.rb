class ProductsController < ApplicationController
  def index
    @categories = CategoryProduct.all

  end

  def show
    @product = Product.find(params[:id])
  end
end
