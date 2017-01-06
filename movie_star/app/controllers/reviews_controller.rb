class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @review = Review.new
  end

  def create
    # if has_not_reviewed?
      @review = Review.new(body: params[:review][:body], movie_id: params[:movie_id], reviewer_id: current_user.id)
      if @review.save
        redirect_to "/movies/#{params[:movie_id]}"
      end
    # else
    #   render 'movies#show'
    # end
  end


end
