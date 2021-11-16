class AuthorsController < ApplicationController
  def search

  end

  def show
    @author = Author.find(params[:id])
  end
end
