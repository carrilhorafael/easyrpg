require 'rails_helper'

describe ::Player::Login, type: :interactor do
  describe '.call' do
    context 'when fails' do
      it 'returns a failure context' do
        result = Player::Login.call(player: nil)

        expect(result).to be_a_failure
      end
    end

    context 'when success' do
      let(:player) { create(:player) }

      context "when pass player" do
        it 'returns a success context' do
          result = Player::Login.call(player: player)

          expect(result).to be_a_success
          expect(result.player.last_login_at).not_to be_nil
          expect(result.player.login_count).to eq(1)
        end

        it 'returns a token' do
          result = Player::Login.call(player: player)

          expect(result.token).to be_present
        end
      end

      context "when pass player_params" do
        it 'returns a success context' do
          result = Player::Login.call(player_params: { email: player.email, password: player.password })

          expect(result).to be_a_success
          expect(result.player.last_login_at).not_to be_nil
          expect(result.player.login_count).to eq(1)
        end

        it 'returns a token' do
          result = Player::Login.call(player_params: { email: player.email, password: player.password })

          expect(result.token).to be_present
        end
      end
    end
  end
end
