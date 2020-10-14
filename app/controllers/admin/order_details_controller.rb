class Admin::OrderDetailsController < ApplicationController
  def update
       order_detail = OrderDetail.find(params[:id])
       order_detail.update(order_detail_params)
     if order_detail.making_status == 2
       order_detail.order.update(status: 2) 
     end

     if order_detail.order.order_details.count == order_detail.order.order_details.where(making_status:3).count
       order_detail.order.update(status: 3) 
     end 
     redirect_to admin_order_path(order_detail.order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
