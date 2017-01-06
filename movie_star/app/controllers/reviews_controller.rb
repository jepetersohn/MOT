class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end


  def create
    @movie = Movie.find_by(id: params[:movie_id])
    movie_id = params[:movie_id]
    @review = Review.new(review_params)
    if has_not_reviewed?(movie_id)
      @review.reviewer_id = current_user.id
      @review.movie_id = movie_id
      if @review.save
        render template: 'movies/show'
      else
        @errors = ["Your review did not save, please try again."]
        render 'new'
      end
    else
      @errors = ["You have already reviewed this."]
      render template: 'movies/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :reviewer_id, :movie_id)
  end


end
