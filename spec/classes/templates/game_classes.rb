require 'rails_helper'
require_relative '../../../app/classes/templates/game_classes_constraints/barbarian.rb'
require_relative '../../../app/classes/templates/game_classes_constraints/bard.rb'
require_relative '../../../app/classes/templates/game_classes_constraints/cleric.rb'

RSpec.describe Templates::GameClasses do
  describe '.all' do
    it 'returns all game classes' do
      expect(Templates::GameClasses.all).to eq([BARBARIAN, BARD, CLERIC])
    end
  end
end
