class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update
      redirect_to my_page_path
    else
      render :edit
    end
  end
  
  def quit
  end

  def withdrawal
  end




end
