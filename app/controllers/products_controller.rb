class ProductsController < ApplicationController
   before_action :authenticate_user!, only: [:show]
  def index
    @categories = CategoryProduct.all

  end

  def show
    @product = Product.find(params[:id])
  end
end
