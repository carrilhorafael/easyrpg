require "rails_helper"

RSpec.describe AdventureSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/adventures/1/sessions").to route_to("adventure_sessions#index", adventure_id: "1")
    end

    it "routes to #show" do
      expect(get: "/adventures/1/sessions/1").to route_to("adventure_sessions#show", id: "1", adventure_id: "1")
    end

    it "routes to #create" do
      expect(post: "/adventures/1/sessions").to route_to("adventure_sessions#create", adventure_id: "1")
    end

    it "routes to #finish" do
      expect(post: "/adventures/1/sessions/1/finish").to route_to("adventure_sessions#finish", id: "1", adventure_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/adventures/1/sessions/1").to route_to("adventure_sessions#update", id: "1", adventure_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/adventures/1/sessions/1").to route_to("adventure_sessions#update", id: "1", adventure_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/adventures/1/sessions/1").to route_to("adventure_sessions#destroy", id: "1", adventure_id: "1")
    end
  end
end
