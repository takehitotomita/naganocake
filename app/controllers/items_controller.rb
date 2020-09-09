class ItemsController < ApplicationController
  before_action :authenticate_session!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new
    item.save
    redirect_to item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
end