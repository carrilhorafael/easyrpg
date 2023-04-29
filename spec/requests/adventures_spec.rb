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

RSpec.describe "/adventures", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Adventure. As you add validations to Adventure, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) {
    {
      name: "First Adventure",
      abilities: ['Strengh', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma'],
      skills: [{ name: 'Acrobatics', ability: 'Dexterity' }, { name: 'Animal Handling', ability: 'Wisdom' }, { name: 'Arcana', ability: 'Intelligence' }, { name: 'Athletics', ability: 'Strengh' }, { name: 'Deception', ability: 'Charisma' }, { name: 'History', ability: 'Intelligence' }, { name: 'Insight', ability: 'Wisdom' }, { name: 'Intimidation', ability: 'Charisma' }, { name: 'Investigation', ability: 'Intelligence' }, { name: 'Medicine', ability: 'Wisdom' }, { name: 'Nature', ability: 'Intelligence' }, { name: 'Perception', ability: 'Wisdom' }, { name: 'Performance', ability: 'Charisma' }, { name: 'Persuasion', ability: 'Charisma' }, { name: 'Religion', ability: 'Intelligence' }, { name: 'Sleight of Hand', ability: 'Dexterity' }, { name: 'Stealth', ability: 'Dexterity' }, { name: 'Survival', ability: 'Wisdom' }]
    }
  }

  let(:invalid_attributes) {
    { name: nil, data: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # AdventuresController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    @authenticated_headers
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:adventure)
      get adventures_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      adventure = create(:adventure)
      get adventure_url(adventure), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Adventure" do
        expect {
          post adventures_url,
               params: { adventure: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Adventure, :count).by(1)
      end

      it "renders a JSON response with the new adventure" do
        post adventures_url,
             params: { adventure: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Adventure" do
        expect {
          post adventures_url,
               params: { adventure: invalid_attributes }, as: :json
        }.to change(Adventure, :count).by(0)
      end

      it "renders a JSON response with errors for the new adventure" do
        post adventures_url,
             params: { adventure: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Second Adventure" }
      }

      it "updates the requested adventure" do
        adventure = create(:adventure, gamemaster: @active_user)

        patch adventure_url(adventure),
              params: { adventure: new_attributes }, headers: valid_headers, as: :json
        adventure.reload
        expect(adventure.name).to eq("Second Adventure")
      end

      it "renders a JSON response with the adventure" do
        adventure = create(:adventure, gamemaster: @active_user)
        patch adventure_url(adventure),
              params: { adventure: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the adventure" do
        adventure = create(:adventure, gamemaster: @active_user)
        patch adventure_url(adventure),
              params: { adventure: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested adventure" do
      adventure = create(:adventure, gamemaster: @active_user)
      expect {
        delete adventure_url(adventure), headers: valid_headers, as: :json
      }.to change(Adventure, :count).by(-1)
    end
  end
end
