class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :reviewer_id
  has_many :ratings, foreign_key: :rater_id
  has_many :reviewed_movies, through: :reviews, source: :movie
  has_many :rated_reviews, through: :ratings, source: :reviews
end
