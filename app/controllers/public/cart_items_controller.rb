class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
    binding.pry
    
    cart_item = cart_item.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    
  end

  def destroy
  end

  def destroy_all
  end
  
  private
  
  def cart_item_params
    prams.require(:cart_item).permit(:item_id, :amount)
  end

end
