class Public::OrdersController < ApplicationController
  
  def new
    @order = current_customer
  end
  
  def confirm
    @order = current_customer
  end
  
  def thanks
  end
 
  def create
    @order = current_customer
  end

  def index
    @order = current_customer
  end
  
  def show
  end

end
