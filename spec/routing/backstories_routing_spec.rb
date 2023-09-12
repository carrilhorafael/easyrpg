require "rails_helper"

RSpec.describe BackgroundsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/backgrounds").to route_to("backgrounds#index")
    end

    it "routes to #show" do
      expect(get: "/backgrounds/1").to route_to("backgrounds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/backgrounds").to route_to("backgrounds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/backgrounds/1").to route_to("backgrounds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/backgrounds/1").to route_to("backgrounds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/backgrounds/1").to route_to("backgrounds#destroy", id: "1")
    end
  end
end
