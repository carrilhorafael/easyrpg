require 'rails_helper'

RSpec.describe Player::SignUp, type: :interactor do
  describe '.call' do
    context 'should fails' do
      it 'when does not pass player_params' do
        result = Player::SignUp.call(player_params: nil)

        expect(result).to be_a_failure
      end

      it 'when pass invalid player_params' do
        result = Player::SignUp.call(player_params: { name: Faker::Name.name, email: Faker::Internet.email, password: 'password' })

        expect(result).to be_a_failure
      end
    end

    context 'when success' do
      let(:player_params) { { name: Faker::Name.name, email: Faker::Internet.email, password: 'Password1' } }

      context "create a new player" do
        it { expect(Player::SignUp.call(player_params: player_params)).to be_a_success }
        it { expect(Player::SignUp.call(player_params: player_params).player).to be_a Player }
        it { expect(Player::SignUp.call(player_params: player_params).player).to be_persisted }
      end

      it 'returns a session token' do
        result = Player::SignUp.call(player_params: player_params)

        expect(result.token).to be_present
      end
    end
  end
end
