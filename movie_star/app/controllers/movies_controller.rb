class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort.first(50)
  end

  def show
  	@movie = Movie.find_by(id: params[:id])
  end

end
