require 'rails_helper'

describe MoviesController do
  let!(:movie) { Movie.create!(title: "When Harry Met Sally", year: 1988, actors: "Billy Crystal, Meg Ryan", runtime: 189, plot: "A friendly couple falls in love") }

    describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns 50 movies as @movies" do
      get :index
      expect(assigns(:movies)).to eq(Movie.all.first(50))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

    describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: movie.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct movie as @movie" do
      get :show, { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the :show template" do
      get :show, { id: movie.id }
      expect(response).to render_template(:show)
    end
  end

end
