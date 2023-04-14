require 'rails_helper'

RSpec.describe "/players", type: :request do

  let(:valid_attributes) {
    { name: Faker::Name.name, email: Faker::Internet.email, password: 'Password1' }
  }

  describe "POST /sign_up" do
    it "creates a new Player" do
      post '/sign_up', params: { player: valid_attributes }, as: :json

      expect(response).to have_http_status(:created)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

  describe "POST /login" do
    it "login a Player" do
      player = Player.create! valid_attributes
      post '/login', params: { player: { email: player.email, password: 'Password1' } }, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including("application/json"))
      expect(JSON.parse(response.body)['meta']['token']).not_to be_nil
    end
  end
end
