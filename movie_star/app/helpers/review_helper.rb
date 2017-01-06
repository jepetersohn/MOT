module ReviewHelper

  def has_not_reviewed?
    if active_session?
      movie = Movie.find_by(id: params[:id])
      reviewers = movie.reviews.map { |review| review.reviewer_id }
      reviewers.include?(current_user.id)
    end
  end

end
