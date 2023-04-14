require "rails_helper"

RSpec.describe PlayersController, type: :routing do
  describe "routing" do
    it "routes to #sign_up" do
      expect(post: "/sign_up").to route_to("auth#sign_up")
    end

    it "routes to #login" do
      expect(post: "/login").to route_to("auth#login")
    end
  end
end
