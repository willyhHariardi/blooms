class LandingController < ApplicationController
  def index
    @top_4_products = Product.all.limit(4)
    @best_4_products = Product.all.limit(4)
  end
end
