require "rails_helper"

RSpec.describe "Routing to reviews", type: :routing do
  it "routes GET /reviews to reviews#index" do
    expect(get: "/reviews").to route_to("reviews#index")
  end

end
