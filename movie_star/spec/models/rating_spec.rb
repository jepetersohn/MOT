require 'rails_helper'


describe Review do
  let(:review) { Review.new(body: "Great film.", reviewer_id: nil, movie_id: 1) }

  it "should have a body" do
    expect(review.body).to eq "Great film."
  end

  it "should not have a reviewer_id" do
    expect(review.reviewer_id).to eq nil
  end

  it "should have actors" do
    expect(review.movie_id).to eq 1
  end
end
