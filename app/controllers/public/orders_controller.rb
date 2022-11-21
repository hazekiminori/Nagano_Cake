class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    @order.save
    redirect_to confirm_path
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)

    @order = Order.new(order_params)
    if params[:order][:address_id] == "0"
      @order.postal_code= current_customer.postal_code
      @order.address= current_customer.address
      @order.name= current_customer.full_name
    elsif params[:order][:address_id] == "1"
      @order.postal_code= Address.postal_code
      @order.address= Address.address
      @order.name= Address.name
    else params[:order][:address_id] == "2"
      @order.postal_code
      @order.address
      @order.name
    #binding.pry
    end
  end

  def thanks
  end

  def index
    @order = current_customer.order
  end

  def show
    @customer = current_customer
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.where(customer_id: current_customer.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
