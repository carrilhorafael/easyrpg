require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/heroes", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Hero. As you add validations to Hero, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Volo Levantein" }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # heroesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:hero, player: @active_user, name: "Volo Levantein")
      get heroes_url, headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      hero = create(:hero, player: @active_user, name: "Volo Levantein")
      get hero_url(hero), headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Hero" do
        expect {
          post heroes_url,
               params: { hero: valid_attributes }, headers: @authenticated_headers, as: :json
        }.to change(Hero, :count).by(1)
      end

      it "renders a JSON response with the new hero" do
        post heroes_url,
             params: { hero: valid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Hero" do
        expect {
          post heroes_url,
               params: { hero: invalid_attributes }, as: :json
        }.to change(Hero, :count).by(0)
      end

      it "renders a JSON response with errors for the new hero" do
        post heroes_url,
             params: { hero: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Selena Levantein", personality_traits: { alignment: "Chaotic Neutral" } }
      }

      it "updates the requested hero" do
        hero = create(:hero, player: @active_user, name: "Volo Levantein")
        patch hero_url(hero),
              params: { hero: new_attributes }, headers: @authenticated_headers, as: :json
        hero.reload

        expect(hero.name).to eq("Selena Levantein")
        expect(hero.personality_traits["alignment"]).to eq("Chaotic Neutral")
      end

      it "renders a JSON response with the hero" do
        hero = create(:hero, player: @active_user, name: "Volo Levantein")
        patch hero_url(hero),
              params: { hero: new_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the hero" do
        hero = create(:hero, player: @active_user, name: "Volo Levantein")
        patch hero_url(hero),
              params: { hero: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested hero" do
      hero = create(:hero, player: @active_user, name: "Volo Levantein")
      expect {
        delete hero_url(hero), headers: @authenticated_headers, as: :json
      }.to change(Hero, :count).by(-1)
    end
  end
end
