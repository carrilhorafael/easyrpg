require "rails_helper"

RSpec.describe GameClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/game_classes").to route_to("game_classes#index")
    end

    it "routes to #show" do
      expect(get: "/game_classes/1").to route_to("game_classes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/game_classes").to route_to("game_classes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/game_classes/1").to route_to("game_classes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/game_classes/1").to route_to("game_classes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/game_classes/1").to route_to("game_classes#destroy", id: "1")
    end
  end
end
