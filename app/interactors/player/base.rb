class Player::Base
  include Interactor

  def player
    context.player
  end
end
