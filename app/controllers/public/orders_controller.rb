class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    binding.pry
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to confirm_path
  end

  def index
    @order = current_customer
  end

  def show
    @customer = current_customer
    @cart_items = CartItem.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end


end
