require "rails_helper"

RSpec.describe TalentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/talents").to route_to("talents#index")
    end

    it "routes to #show" do
      expect(get: "/talents/1").to route_to("talents#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/talents").to route_to("talents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/talents/1").to route_to("talents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/talents/1").to route_to("talents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/talents/1").to route_to("talents#destroy", id: "1")
    end
  end
end
