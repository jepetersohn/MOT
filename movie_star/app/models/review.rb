class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :reviewer, class_name: "User"
  has_many   :ratings

  validates :body, presence: true

  def average_rating
    self.ratings.average(:score).to_i
  end

  def display_rating
    ratings = []
    star = "\u2B50"
    star.encode('utf-8')
    self.average_rating.times do
      ratings << star.encode('utf-8')
    end
    return ratings.join(' ')
  end
end
