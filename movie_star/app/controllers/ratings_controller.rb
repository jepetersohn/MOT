class RatingsController < ApplicationController

  def create
    @rating = Rating.new(score: params[:rating], rater_id: session[:user_id], review_id: params[:id])
    if @rating.save
      redirect_to "/movies/#{@rating.review.movie.id}"
    end
  end

end
