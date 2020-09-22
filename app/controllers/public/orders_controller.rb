class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
 
  end
  def comfirm

    @order = Order.new
   if  params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
  elsif params[:order][:address_option] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
  elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items
    @sum = 0

  end

  def complete
    @order = Order.new

  end

  def create
    @order = Order.new(order_params)
    p '---------------------'
    p @order
    p order_params
    @order.customer_id = current_customer.id
    @order.shopping_cost = 800
    @order.save

    current_customer.cart_items.each do |cart_item|
      OrderDetail.new(order_id: @order.id, item_id: cart_item.item_id, 
        price: cart_item.item.price, amount: cart_items.amount)
    
    current_customer.cart_items.destroy_all
    end
    
    redirect_to public_orders_complete_path


  end

  def index
    @orders = Order.all
  end

  def show
    @sum = 0
    @order = Order.find(params[:id])
    @cart_items = CartItem.all
    #order_params = params[:order][:payment_method] + params[:order][:postal_code] +
#@order = Order.new()
#@order.postal_code = params[:order][:payment_method]
#@order.
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment)
  end
end
