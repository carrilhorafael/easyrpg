require 'rails_helper'

RSpec.describe Templates::GameClasses do
  describe '.all' do
    it 'returns all game classes' do
      expect(Templates::GameClasses.all).to eq([BARBARIAN, BARD, CLERIC])
    end
  end
end
