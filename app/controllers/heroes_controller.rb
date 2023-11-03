class HeroesController < ApplicationController
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heroes
  def index
    @heroes = @current_player.heroes

    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @hero
  end

  # POST /heroes
  def create
    action = Hero::Create.call(hero_params: creation_hero_params, performer: @current_player)

    if action.success?
      render json: action.hero, status: :created, location: action.hero
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1
  def update
    action = Hero::Update.call(hero_params: hero_params, hero: @hero, performer: @current_player)

    if action.success?
      render json: action.hero
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = @current_player.heroes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name, :adventure_id, :race_id, :background_id, body_traits: {}, personality_traits:{}, game_class_ids: [], talent_ids: [])
    end

    def creation_hero_params
      params.require(:hero).permit(:name)
    end
end
