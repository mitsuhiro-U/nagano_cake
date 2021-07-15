class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_path
  end

  def withdrawal
  end

  def withdrawal_update
    @customer = current_customer
    @customer.update(is_active: false)
    redirect_to top_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:postal_code, :address, :first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :email)
  end
  
end
