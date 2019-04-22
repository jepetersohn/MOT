require 'rails_helper'

describe Movie do
  let(:movie) { Movie.new(title: "When Harry Met Sally", year: 1988, actors: "Billy Crystal, Meg Ryan", runtime: 189, plot: "A friendly couple falls in love") }

  it "should have a title" do
    expect(movie.title).to eq "When Harry Met Sally"
  end

end
