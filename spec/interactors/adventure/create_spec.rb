require 'rails_helper'

describe 'Adventure::Create', type: :interactor do
  subject(:action) { Adventure::Create.call(adventure_params: adventure_params, performer: master) }
  let(:master) { create(:player) }

  let(:adventure_params) {
    {
      name: "First Adventure",
      abilities: ['Strengh', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma'],
      skills: [{ name: 'Acrobatics', ability: 'Dexterity' }, { name: 'Animal Handling', ability: 'Wisdom' }, { name: 'Arcana', ability: 'Intelligence' }, { name: 'Athletics', ability: 'Strengh' }, { name: 'Deception', ability: 'Charisma' }, { name: 'History', ability: 'Intelligence' }, { name: 'Insight', ability: 'Wisdom' }, { name: 'Intimidation', ability: 'Charisma' }, { name: 'Investigation', ability: 'Intelligence' }, { name: 'Medicine', ability: 'Wisdom' }, { name: 'Nature', ability: 'Intelligence' }, { name: 'Perception', ability: 'Wisdom' }, { name: 'Performance', ability: 'Charisma' }, { name: 'Persuasion', ability: 'Charisma' }, { name: 'Religion', ability: 'Intelligence' }, { name: 'Sleight of Hand', ability: 'Dexterity' }, { name: 'Stealth', ability: 'Dexterity' }, { name: 'Survival', ability: 'Wisdom' }]
    }
  }


  describe '.call' do
    it { expect { action }.to change { master.mastered_adventures.count }.by(1) }
    it { expect { action }.to change { Adventure.count }.by(1) }
    it { expect { action }.to change { ActivityLog.where(activity: 'adventure::create').count }.by(1) }
  end
end
