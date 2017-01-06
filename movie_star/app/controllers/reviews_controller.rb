class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end


  def create
    if has_not_reviewed?
      @review = Review.new(body: params[:body], movie_id: params[:id], reviewer_id: current_user.id)
      if @review.save
        redirect_to "movie_path"
      end
    else
      render 'movies#show'
    end
  end


end
