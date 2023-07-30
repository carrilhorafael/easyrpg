class RacesController < ApplicationController
  before_action :set_race, only: [:show, :update, :destroy]

  # GET /races
  def index
    @races = @current_player.races + Race.default

    render json: @races
  end

  # GET /races/1
  def show
    render json: @race
  end

  # POST /races
  def create
    action = Race::Create.call(performer: @current_player, race_params: race_params)

    if action.success?
      render json: action.race, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /races/1
  def update
    action = Race::Update.call(race: @race, performer: @current_player, race_params: race_params)

    if action.success?
      render json: action.race
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /races/1
  def destroy
    @race.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = @current_player.races.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def race_params
      params.require(:race).permit!
    end
end
