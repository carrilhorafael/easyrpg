class Player::SignUp < Player::Base
  after :reload_resource

  def call
    action_validation
    build_player
    validate_model

    ActiveRecord::Base.transaction do
      save_player
      generate_session
    end
  end

  private

  def action_validation
    context.fail!(errors: 'Missing player params') unless context.player_params
  end

  def build_player
    context.player = Player.new(context.player_params)
  end

  def validate_model
    context.fail!(errors: context.player.errors) unless player.valid?
  end

  def save_player
    player.save!
  end

  def generate_session
    action = Player::Login.call(player: player)
    context.fail!(errors: action.errors) unless action.success?

    context.token = action.token
  end
end
