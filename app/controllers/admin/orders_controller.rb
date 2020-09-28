class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show

  	@order = Order.find(params[:id])
  	@order_details = OrderDetail.where(order_id: @order.id)
   

    
    

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == 1
       order_details = order.order_details
       order_details.each do |order_detail|
       order_detail.update(making_status: 1)
       end
    end
    redirect_to admin_orders_path
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
