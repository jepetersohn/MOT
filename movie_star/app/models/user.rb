class User < ActiveRecord::Base
  include BCrypt
  has_many :reviews, foreign_key: :reviewer_id
  has_many :ratings, foreign_key: :rater_id
  has_many :reviewed_movies, through: :reviews, source: :movie
  has_many :rated_reviews, through: :ratings, source: :review

  validates :username, :email, :hashed_password, {presence: true}
  validates :username, :email, {uniqueness: true}
  validate  :password_errors

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

   def password_errors
     if @raw_password.length < 5
       errors.add(:password, "Password must be at least 5 characters")
     end
   end

  def authenticate(password)
    self.password == password
  end

end
