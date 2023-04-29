class AdventuresController < ApplicationController
  before_action :find_mastered_adventure, only: [:update, :destroy]

  def index
    @adventures = @current_player.mastered_adventures

    render json: @adventures
  end

  def show
    @adventure = Adventure.find(params[:id])
    render json: @adventure
  end

  def create
    action = Adventure::Create.call(adventure_params: adventure_params, performer: @current_player)

    if action.success?
      render json: action.adventure, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def update
    action = Adventure::Update.call(adventure: @adventure, performer: @current_player, adventure_params: adventure_params)

    if action.success?
      render json: action.adventure
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @adventure.destroy
  end

  private

    def find_mastered_adventure
      @adventure = @current_player.mastered_adventures.find(params[:id])
    end

    def adventure_params
      params.require(:adventure).permit(:name, abilities: [], skills: [:name, :ability])
    end
end
