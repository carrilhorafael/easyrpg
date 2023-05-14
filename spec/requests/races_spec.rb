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

RSpec.describe "/races", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Race. As you add validations to Race, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: 'Elf', only_subraces: false, normal_size: 'medium' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # RacesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:race, creator: @active_user)
      get races_url, headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      race = create(:race, creator: @active_user)
      get race_url(race), headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Race" do
        expect {
          post races_url,
               params: { race: valid_attributes }, headers: @authenticated_headers, as: :json
        }.to change(Race, :count).by(1)
      end

      it "renders a JSON response with the new race" do
        post races_url,
             params: { race: valid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Race" do
        expect {
          post races_url,
               params: { race: invalid_attributes }, headers: @authenticated_headers, as: :json
        }.to change(Race, :count).by(0)
      end

      it "renders a JSON response with errors for the new race" do
        post races_url,
             params: { race: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: "Elf 2", only_subraces: true, normal_size: "small" }
      }

      it "updates the requested race" do
        race = create(:race, creator: @active_user)
        patch race_url(race),
              params: { race: new_attributes }, headers: @authenticated_headers, as: :json
        race.reload
        expect(race.title).to eq("Elf 2")
        expect(race.only_subraces).to eq(true)
        expect(race.normal_size).to eq('small')
      end

      it "renders a JSON response with the race" do
        race = create(:race, creator: @active_user)
        patch race_url(race),
              params: { race: new_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the race" do
        race = create(:race, creator: @active_user)
        patch race_url(race),
              params: { race: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested race" do
      race = create(:race, creator: @active_user)
      expect {
        delete race_url(race), headers: @authenticated_headers, as: :json
      }.to change(Race, :count).by(-1)
    end
  end
end
