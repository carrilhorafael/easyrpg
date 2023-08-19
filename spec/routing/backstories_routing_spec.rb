require "rails_helper"

RSpec.describe BackstoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/backstories").to route_to("backstories#index")
    end

    it "routes to #show" do
      expect(get: "/backstories/1").to route_to("backstories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/backstories").to route_to("backstories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/backstories/1").to route_to("backstories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/backstories/1").to route_to("backstories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/backstories/1").to route_to("backstories#destroy", id: "1")
    end
  end
end
