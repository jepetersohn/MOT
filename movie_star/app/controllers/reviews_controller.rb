class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @review = Review.new

    if request.xhr?
      @review
      render :'/reviews/_form', layout: false
    else
      @review
    end
  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    movie_id = params[:movie_id]
    @review = Review.new(review_params)
    @review.reviewer_id = current_user.id
    @review.movie_id = movie_id
    if has_not_reviewed?(movie_id)
      if @review.save
        if request.xhr?
          @review
          render :'/movies/_display_review', layout: false
        else
          redirect_to "/movies/#{params[:movie_id]}"
        end
      else
        if request.xhr?
          status 404
        else
          @errors = ["Your review did not save, please try again."]
          render 'new'
        end
      end
    else
      @errors = ["You have already reviewed this."]
      render template: 'movies/show'
    end
  end

  # render template: 'movies/show'

  private

  def review_params
    params.require(:review).permit(:body, :reviewer_id, :movie_id)
  end


end
