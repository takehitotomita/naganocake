class Admin::GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  	#is_active,true = "販売中"
    #is_active,false = "販売停止中"
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
  	 @genre = Genre.find(params[:id])
  	 @genre.update(genre_params)
  	 redirect_to admin_genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end
end
