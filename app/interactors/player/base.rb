class Player::Base < AbstractInteractor
  def resource
    player
  end

  def player
    context.player
  end
end
