class Admin::GenresController < ApplicationController
  
  def index
    @genres= Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to "/admin/genres"
  end
  
end
