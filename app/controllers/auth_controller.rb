class AuthController < ApplicationController

  def sign_up
    action = Player::SignUp.call(player_params: player_params)

    if action.success?
      render json: action.player, meta: { token: action.token }, status: :created, adapter: :json
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  def login
    action = Player::Login.call(player_params: player_params)

    if action.success?
      render json: action.player, meta: { token: action.token }, status: :ok, adapter: :json
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :password)
  end

end
