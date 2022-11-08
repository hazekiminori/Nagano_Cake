class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    item.save
    redirect_to Item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    
    if item.update
    redirect_to admin_item_path
    else
    render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end
end
