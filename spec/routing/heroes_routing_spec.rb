require "rails_helper"

RSpec.describe HeroesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/heroes").to route_to("heroes#index")
    end

    it "routes to #show" do
      expect(get: "/heroes/1").to route_to("heroes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/heroes").to route_to("heroes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/heroes/1").to route_to("heroes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/heroes/1").to route_to("heroes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/heroes/1").to route_to("heroes#destroy", id: "1")
    end
  end
end
