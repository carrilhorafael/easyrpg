require 'rails_helper'

RSpec.describe "/players", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Player. As you add validations to Player, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: Faker::Name.name, email: Faker::Internet.email, password: 'Password1' }
  }

  let(:invalid_attributes) {
    { name: nil, email: nil, password: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PlayersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Player.create! valid_attributes
      get players_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      player = Player.create! valid_attributes
      get player_url(player), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Player" do
        expect {
          post players_url,
               params: { player: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Player, :count).by(1)
      end

      it "renders a JSON response with the new player" do
        post players_url,
             params: { player: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Player" do
        expect {
          post players_url,
               params: { player: invalid_attributes }, as: :json
        }.to change(Player, :count).by(0)
      end

      it "renders a JSON response with errors for the new player" do
        post players_url,
             params: { player: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: Faker::Name.name, email: Faker::Internet.email, password: 'Password1' }
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        patch player_url(player),
              params: { player: new_attributes }, headers: valid_headers, as: :json
        player.reload

        expect(player.name).to eq(new_attributes[:name])
        expect(player.email).to eq(new_attributes[:email])
      end

      it "renders a JSON response with the player" do
        player = Player.create! valid_attributes
        patch player_url(player),
              params: { player: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the player" do
        player = Player.create! valid_attributes
        patch player_url(player),
              params: { player: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested player" do
      player = Player.create! valid_attributes
      expect {
        delete player_url(player), headers: valid_headers, as: :json
      }.to change(Player, :count).by(-1)
    end
  end
end
