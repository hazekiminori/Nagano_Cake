class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end
end
