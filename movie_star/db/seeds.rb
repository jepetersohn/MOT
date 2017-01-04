# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    hashed_password: 'password',
    trusted_reviewer: false
  )
end

3.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    hashed_password: 'password',
    trusted_reviewer: true
  )
end

categories = ['Horror', 'Drama', 'Comedy', 'Sci-Fi', 'Suspense']

categories.each do |category|
  Category.create(genre: category)
end

#10.times do
  #Restaurant.create(
    #name: Faker::StarWars.vehicle.to_s + " " + ['Cafe', 'Diner', 'Dive', 'Steakhouse', 'Bistro'].sample,
    #planet: Faker::StarWars.planet,
    #city: Faker::Pokemon.location,
    #food: ['Comfort', 'Fine Dining', 'BBQ', 'Sushi', 'Italian', 'Farm to Table'].sample,
    #admin_id: rand(1..5),
  #)
#end
actors = ['Tom Hanks', 'Tom Cruise', 'Matthew Broderick', 'Cillian Murphy', 'Naomie Harris']

10.times do
  Movie.create(
    title: Faker::Hipster.words(2).join(''),
    year: rand(1988..2016),
    actors: actors.sample,
    runtime: 90,
    plot: Faker::Hipster.sentence,
    category_id: rand(1..10)
  )
end

100.times do
  Review.create(
    body: Faker::Hipster.sentence,
    reviewer_id: rand(6..8),
    movie_id: rand(1..10)
  )
end

125.times do
  Rating.create(
    score: rand(1..5),
    rater_id: rand(1..5),
    review_id: rand(1..100)
  )
end
