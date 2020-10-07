class Public::ItemsController < ApplicationController
  def top
  end

  def index
  	@items = Item.fetch_valid
    @genres = Genre.fetch_valid
    if params[:genre_id].present?
       @items = @items.where(genre_id: params[:genre_id])
       @genre = Genre.find(params[:genre_id])
    end
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
    @genres = Genre.all
    
  end

  def items
    params.require(:item).permit(:name, :price, :amount)
  end
end

