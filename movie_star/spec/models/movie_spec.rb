require 'rails_helper'

describe Movie do
  let(:movie) { Movie.new(title: "When Harry Met Sally", year: 1988, actors: "Billy Crystal, Meg Ryan", runtime: 189, plot: "A friendly couple falls in love") }

  it "should have a title" do
    expect(movie.title).to eq "When Harry Met Sally"
  end

  it "should have a year" do
    expect(movie.year).to eq 1988
  end

  it "should have actors" do
    expect(movie.actors).to eq "Billy Crystal, Meg Ryan"
  end

  it "should have a runtime" do
    expect(movie.runtime).to eq "189"
  end

  it "should have a plot" do
    expect(movie.plot).to eq "A friendly couple falls in love"
  end
end
