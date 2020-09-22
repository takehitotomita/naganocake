class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@cart_items = CartItem.all
  	@sum = 0
  	shopping_cost = 800
  end

  def update
  end
end
