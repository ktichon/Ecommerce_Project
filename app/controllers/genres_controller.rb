class GenresController < ApplicationController
  def search
  end

  def index
    @genres = Genre.includes(:books).all


  end

  def show
    @genre = Genre.find(params[:id])
  end
end
