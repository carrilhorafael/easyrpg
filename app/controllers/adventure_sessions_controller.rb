class AdventureSessionsController < ApplicationController
  before_action :set_mastered_adventure, only: [:create, :update, :finish, :destroy]
  before_action :set_adventure, only: [:index, :show]
  before_action :set_adventure_session, only: [:show, :update, :destroy, :finish]

  def index
    render json: @adventure.sessions
  end

  def show
    render json: @adventure_session
  end

  def create
    action = Adventure::InitiateSession.call(adventure: @adventure, session_params: adventure_session_params, performer: @current_player)

    if action.success?
      render json: action.session, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def update
    action = Adventure::UpdateSession.call(adventure: @adventure, session: @adventure_session, session_params: adventure_session_params, performer: @current_player)

    if action.success?
      render json: action.session
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def finish
    action = Adventure::FinishSession.call(adventure: @adventure, session: @adventure_session, performer: @current_player)

    if action.success?
      render json: action.session
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @adventure_session.destroy
  end

  private

    def set_mastered_adventure
      @adventure = @current_player.mastered_adventures.find(params[:adventure_id])
    end

    def set_adventure
      @adventure = Adventure.find(params[:adventure_id])
    end

    def set_adventure_session
      @adventure_session = @adventure.sessions.find(params[:id])
    end

    def adventure_session_params
      params.require(:adventure_session).permit(:title, :description)
    end
end
