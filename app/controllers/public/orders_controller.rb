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
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
         if @order_details.save!
            cart_item.destroy
         end
      end
          redirect_to thanks_path

  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)

    if params[:order][:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_id] == "1"
      @order.postal_code = Address.postal_code
      @order.address = Address.address
      @order.name = Address.name
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
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
      @order.order_details.each do |order_detail|
        @total += (order_detail.price*1.1).floor*order_detail.amount
      end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :created_at, :total_payment)
  end

end

