class ApplicationController < ActionController::API
  before_action :set_current_player

  private

  def auth_token
    request.headers['Authorization']
  end

  def decoded_token
    SessionGenerator.decode(auth_token) if auth_token
  end

  def set_current_player
    # return head 403 if !auth_token || !decoded_token || decoded_token['exp'] < Time.now.to_i

    @current_player ||= Player.first
  end
end
