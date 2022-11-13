class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
    binding.pry
    @cart_item = Cart_items.new(cart_item_params)
    if Item.find_by(item_id: [:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
    else
      @cart_item = Cart_item.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update

  end

  def destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    prams.require(:cart_item).permit(:item_id, :amount)
  end

end
