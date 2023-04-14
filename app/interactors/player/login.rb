class Player::Login < Player::Base

  def call
    action_validation
    unless player.present?
      find_player
      authenticate_player
    end
    generate_session
  end

  private

  def action_validation
    context.fail!(errors: 'Missing player params') unless context.player_params || player.present?
  end

  def find_player
    context.player = Player.find_by(email: context.player_params[:email])
    context.fail!(errors: 'Player not found') unless player.present?
  end

  def authenticate_player
    context.fail!(errors: 'Invalid password') unless player.authenticate(context.player_params[:password])
  end

  def generate_session
    context.token = SessionGenerator.encode(player_id: player.id)
    player.update!(
      last_login_at: Time.now,
      login_count: player.login_count + 1
    )
  end
end
