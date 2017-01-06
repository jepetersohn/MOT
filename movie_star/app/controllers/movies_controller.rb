class MoviesController < ApplicationController

  def index
    @movies = Movie.all.first(50)
    @movies.each do |movie|
      first_word_of_title = movie.title.split(/[^[[:word:]]]+/)[0]
      if first_word_of_title == "The" || first_word_of_title == "A"
        movie.title = movie.title.split(' ')[1..-1].join(' ')
      end
      @movies.sort_by! do |movie|
        movie[:title]
      end
    end
  end

  def show
  	@movie = Movie.find_by(id: params[:id])
    @reviews = @movie.reviews
    @rating = Rating.new
  end

end
