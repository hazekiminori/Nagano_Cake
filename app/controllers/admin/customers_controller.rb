class Admin::CustomersController < ApplicationController
  
  before_action :set_customer, only:[:edit, :update]
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to 'admin/customer/:id'
    else
      render :edit
    
  end
  
  private
  
  def set_customer
    @customer = Customer.find(current_user.id)
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end

end
