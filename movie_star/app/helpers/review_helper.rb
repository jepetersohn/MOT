module ReviewHelper

  def has_not_reviewed?(movie_id)
    movie = Movie.find_by(id: movie_id)
    if active_session?
      !movie.reviews.map {|review| review.reviewer_id}.include?(current_user.id)
      # !movie_reviewers.include?(current_user.id)
    end
  end

end
