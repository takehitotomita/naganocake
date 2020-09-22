class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to admin_items_path
    #is_active,true = "販売中"
    #is_active,false = "販売停止中"
  end

  def show
    @item = Item.find(params[:id])
    #is_active,true = "販売中"
    #is_active,false = "販売停止中"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :price)
  end
end
