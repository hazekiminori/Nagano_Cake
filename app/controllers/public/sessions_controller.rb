# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_action :customer_state, only: [:create]
  before_action :customer_state, only:[:create]

  def adter_sign_out_path_for(resource)
    new_customer_session_path
  end

  def after_sign_in_path_for(resource)
    my_page_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end

   def customer_state
     @customer = Customer.find_by(email: params[:customer][:email])

    return if !@customer

    if @customer.valid_password?(params[:customer][:password])
      
    elsif @customer.is_deleted && !false
      redirect_to new_customer_registration_path
    else
      render :create
    end
   end

end
