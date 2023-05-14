require 'rails_helper'

RSpec.describe Templates::Races do
  describe '.all' do
    it 'returns all game classes' do
      expect(Templates::Races.all).to eq([ELF])
    end
  end
end
