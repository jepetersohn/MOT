module ReviewHelper

  def has_not_reviewed?(movie_id)
    movie = Movie.find_by(id: movie_id)
    if active_session?
      !movie.reviews.map {|review| review.reviewer_id}.include?(current_user.id)
    end
  end

  def has_not_rated?(review_id)
    review = Review.find_by(id: review_id)
    if active_session?
      !review.ratings.map {|rating| rating.rater_id}.include?(current_user.id)
    end
  end
end
