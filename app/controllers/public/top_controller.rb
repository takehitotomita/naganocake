class Public::TopController < ApplicationController
  def top
  	@items = Item.first(3)
  end
end
