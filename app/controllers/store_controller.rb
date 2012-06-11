class StoreController < ApplicationController

  def index
    @count = count_increment
    @products = Product.all
    @cart = current_cart
  end
  
end
