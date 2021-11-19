class ApplicationController < ActionController::Base

  before_action :set_up_search
  before_action :set_up_cart
  helper_method :cart

  def set_up_cart
    session[:shopping_cart] ||= Hash.new
  end

  def set_up_search
    allGenres = Genre.all.pluck(:genre_name)
    @searchGenreOptions = allGenres.insert(0, 'All')
  end

  def cart

    Book.find(session[:shopping_cart].keys)
  end
end
