class Admin::OrdersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @total=0
    @order.order_details.each do |order_detail|
    @total += (order_detail.price*1.1).floor*order_detail.amount
    end
  end
end