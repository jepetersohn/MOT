require 'rails_helper'

describe ReviewsController do
  let!(:review) { Review.create!(body: "it sucked", reviewer_id: 1, movie_id: 1) }

 describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the all reviews in descending chronological order as @reviews" do
      get :index
      expect(assigns(:reviews)).to eq(Review.all.order(created_at: :desc))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      it "creates a new review in the database" do
        length = Review.all.length
        Review.create!(body: "it sucked a lot", reviewer_id: 2, movie_id: 2)
        expect(Review.all.length).to eq(length + 1)
      end
    end
  end
end
