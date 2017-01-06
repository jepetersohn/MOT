class Rating < ActiveRecord::Base
  belongs_to :review
  belongs_to :rater, class_name: "User"
end
