class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.all
  end

  def index
    @items = Item.all
  end

end