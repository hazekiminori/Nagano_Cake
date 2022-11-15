class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @items = Item.all
    @item.save
    redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update
    redirect_to admin_items_path
    else
    render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active)
  end
end
