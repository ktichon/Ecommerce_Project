class GenresController < ApplicationController
  def search
  end

  def index
    @genres = Genre.all


  end

  def show
    @genre = Genre.find(params[:id])
  end
end
