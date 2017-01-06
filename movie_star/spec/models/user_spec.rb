require 'rails_helper'

describe User do
  let(:user) { User.new(username: "movielover", email: "jk1@gmail.com", password: "password") }

  it "should have a username" do
    expect(user.username).to eq "movielover"
  end

  it "should have an email" do
    expect(user.email).to eq "jk1@gmail.com"
  end

end
