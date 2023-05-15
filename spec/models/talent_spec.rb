require 'rails_helper'

RSpec.describe Talent, type: :model do
  it { should belong_to(:creator).class_name('Player').optional }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:features) }

  describe 'scopes' do
    context 'default' do
      let!(:talent) { create(:talent) }
      let!(:user_talent) { create(:talent, creator: create(:player)) }

      it { expect(Talent.default).to include(talent) }
      it { expect(Talent.default).not_to include(user_talent) }
    end
  end
end
