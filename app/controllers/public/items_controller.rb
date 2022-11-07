class Public::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

end