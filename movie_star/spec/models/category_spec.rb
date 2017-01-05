require 'rails_helper'

describe Category do
  let(:category) { Category.new(genre: "comedy")}

  it "should have a genere" do
    expect(category.genre).to eq "comedy"
  end

end
