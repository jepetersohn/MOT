require 'rails_helper'

feature "visiting a movie page" do 
	xscenario "the user sees a movie's information" do 
		current_movie = Movie.first

		visit '/movies/1'

		within('#movie-info') do 
			expect(page).to have_content current_movie.title
			current_movie.year
			current_movie.actors
			current_movie.runtime
			current_movie.plot
		end
		expect(page).to have_current_path movie_path(current_movie)
	end

	xscenario "the user sees all revies for the given movie" do 
		current_movie = Movie.first

		visit '/movies/1'

		within('#review-list') do 
			expect(page).to have_content current_movie.reviews 
		end
		expect(page).to have_current_path movie_path(current_movie)
	end

end