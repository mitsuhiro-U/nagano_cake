class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def verification
    
    @cart_items = current_customer.cart_items
    
    @cart_items.each do |cart_item|
      @total_price = 0
      @total_price += cart_item.item.price * cart_item.amount
    end
    
    @order = Order.new
    @order.shipping_cost = 800
    @order.billing_amount = @total_price + @order.shipping_cost
    @order.status = 0
    @order.payment_method = params[:order][:payment_method]
    @order.status = "入金待ち"
    
    if params[:order][:address_kind] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
    elsif params[:order][:address_kind] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
      
    elsif params[:order][:address_kind] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      
    end  
    
  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.item_id = cart_item.item_id
      order_item.price = cart_item.item.price
      order_item.amount = cart_item.amount
      order_item.status = "入金待ち"
      order_item.save
    end
    
    @cart_items.destroy_all
    redirect_to thanks_path
  
    
  end

  def index
    @orders = Order.all
   
    
  end

  def show
    @order = Order.find(params[:id])
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :billing_amount, :payment_method, :status)
  end
  
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :price, :amount, :status)
  end
  
end
