class Public::AddressesController < ApplicationController

  def create
    @customer = current_customer.full_name
    @address = Address.new(address_params)
    @address.save!
    redirect_to addresses_path
  end

  def inde
    @customer = current_customer
    @address = Address.new
    pp @addresses = Address.all
  end

  def edit
  end

  def update
  end

  def delete
  end

private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end

end
