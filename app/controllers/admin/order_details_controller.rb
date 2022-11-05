class Admin::OrderDetailsController < ApplicationController
  
  def show
   @order_detail = Order_detail.find(params[:id])
  end
  
  def update
    @order_detail = Order_detail(params[:id])
    order_detail(order_detail_params)
    redirect_to 
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:amount, :price, :making_status)
  end
  
end
