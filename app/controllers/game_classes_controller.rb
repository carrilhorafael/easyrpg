class GameClassesController < ApplicationController
  before_action :set_game_class, only: [:show, :update, :destroy]

  # GET /game_classes
  def index
    @game_classes = @current_player.game_classes + GameClass.default

    render json: @game_classes
  end

  # GET /game_classes/1
  def show
    render json: @game_class
  end

  # POST /game_classes
  def create
    action = GameClass::Create.call(performer: @current_player, game_class_params: game_class_params)

    if action.success?
      render json: action.game_class, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_classes/1
  def update
    action = GameClass::Update.call(performer: @current_player, game_class: @game_class, game_class_params: game_class_params)

    if action.success?
      render json: action.game_class
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_classes/1
  def destroy
    @game_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_class
      @game_class = @current_player.game_classes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_class_params
      params.require(:game_class).permit!
    end
end
