class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def quit
  end

  def withdrawal
    @customer = current_customer
  end




end
