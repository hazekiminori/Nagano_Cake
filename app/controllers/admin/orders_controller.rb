class Admin::OrdersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @cart_items = Cart_item.where(customer_id: current_customer)
  end
  
end
