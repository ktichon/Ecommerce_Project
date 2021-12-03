class ApplicationController < ActionController::Base

  before_action :set_up_search
  before_action :set_up_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :cart
  helper_method :info_pages

  def set_up_cart
    session[:shopping_cart] ||= Hash.new
  end

  def set_up_search
    allGenres = Genre.all.pluck(:genre_name)
    @searchGenreOptions = allGenres.insert(0, 'All')
  end

  def info_pages
    InfoPage.all
  end


  def cart
    current_cart = []
    total = 0
    session[:shopping_cart].each do |key, value|
      current_book = Book.find(key)
      current_cart << [current_book, value]
      total += current_book.cost * value
    end
    return total, current_cart

    #Book.find(session[:shopping_cart].keys)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:province_id, :address, :postal])
    devise_parameter_sanitizer.permit(:account_update, keys: [:province_id, :address, :postal])
  end
end
