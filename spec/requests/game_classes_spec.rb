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

RSpec.describe "/game_classes", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # GameClass. As you add validations to GameClass, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: "Cleric", description: "Um clerigo", hit_dice: "1d8", abilities_hint: "Sabedoria" }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      GameClass.create! valid_attributes
      get game_classes_url, headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      game_class = GameClass.create! valid_attributes
      get game_class_url(game_class), headers: @authenticated_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameClass" do
        expect {
          post game_classes_url,
               params: { game_class: valid_attributes }, headers: @authenticated_headers, as: :json
        }.to change(GameClass, :count).by(1)
      end

      it "renders a JSON response with the new game_class" do
        post game_classes_url,
             params: { game_class: valid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameClass" do
        expect {
          post game_classes_url,
               params: { game_class: invalid_attributes }, headers: @authenticated_headers, as: :json
        }.to change(GameClass, :count).by(0)
      end

      it "renders a JSON response with errors for the new game_class" do
        post game_classes_url,
             params: { game_class: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: "Cleric 2", description: "Um clerigo alternativo", hit_dice: "1d8", abilities_hint: "Sabedoria" }
      }

      it "updates the requested game_class" do
        game_class = GameClass.create! valid_attributes
        patch game_class_url(game_class),
              params: { game_class: new_attributes }, headers: @authenticated_headers, as: :json
        game_class.reload

        expect(game_class.title).to eq("Cleric 2")
        expect(game_class.description).to eq("Um clerigo alternativo")
      end

      it "renders a JSON response with the game_class" do
        game_class = GameClass.create! valid_attributes
        patch game_class_url(game_class),
              params: { game_class: new_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the game_class" do
        game_class = GameClass.create! valid_attributes
        patch game_class_url(game_class),
              params: { game_class: invalid_attributes }, headers: @authenticated_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game_class" do
      game_class = GameClass.create! valid_attributes
      expect {
        delete game_class_url(game_class), headers: @authenticated_headers, as: :json
      }.to change(GameClass, :count).by(-1)
    end
  end
end
