class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
