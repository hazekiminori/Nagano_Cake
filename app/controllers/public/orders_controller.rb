class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.name = cart_item.item.name
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
          if @order_details.save
            render template:"public/cart_items/destroy_all"
          end
      end
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

      @total = 0
      @cart_items.each do |cart_item|
        @total += cart_item.subtotal
      end
  end

  def thanks
  end

  def index
    @order = current_customer.order
  end

  def show
    @customer = current_customer
    @order = Order.where(customer_id: current_customer.id)
    @order_details = OrderDetail.where(customer_id: current_customer.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage)
  end

end

