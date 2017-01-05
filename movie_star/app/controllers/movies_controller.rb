class MoviesController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @movies = Movie.all.sort.first(50)
  end
end
