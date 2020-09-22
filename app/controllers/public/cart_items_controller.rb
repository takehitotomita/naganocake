class Public::CartItemsController < ApplicationController
  def index
    @sum = 0
    @cart_items = current_customer.cart_items

  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_items = CartItem.where(customer_id: current_customer.id)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.update(amount: cart_item.amount + params[:cart_item][:amount].to_i)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end

    redirect_to public_cart_items_path
  end
  def destroy
     current_customer.cart_items.delete_all
     redirect_to public_cart_items_path
    # @cart = current_cart
    # @cart.destroy
    # session[:cart_item_id] = nil
    # respond_to do |format|
    #   format.html { redirect_to market_url, notice: 'カートが空になりました。' }
    #   format.json { head :no_content }
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
