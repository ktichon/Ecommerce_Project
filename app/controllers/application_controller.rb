class ApplicationController < ActionController::Base
  before_action :set_up_search
  def set_up_search
    allGenres = Genre.all.pluck(:genre_name)
    @searchGenreOptions = allGenres.insert(0, 'All')
  end
end
