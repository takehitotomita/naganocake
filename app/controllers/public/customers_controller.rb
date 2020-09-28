class Public::CustomersController < ApplicationController
  def show
　　customer = Customer.where(customer_id: current_customer.id)
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer(customer_id)
  end

  def unsubscribe
    customer = Customer.where(customer_id: current_customer.id)
    @customer = Customer.new
  end

  def withdraw
    # @customer = Customer.new(customer_params)
    # customer.save
    # redirect_to public_customer(customer_id) 
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, 
      :last_name_kana, :first_name_kana, :address, :postal_code, 
      :email, :telephone_number, :is_deleted)
  end
end
