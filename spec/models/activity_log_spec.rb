require 'rails_helper'

RSpec.describe ActivityLog, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:performer).class_name('Player') }
    it { is_expected.to belong_to(:adventure) }
    it { is_expected.to belong_to(:session).class_name('AdventureSession').optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:activity) }
    it { is_expected.to validate_presence_of(:text) }
  end

  describe '.log!' do
    let(:master) { create(:player) }
    let(:adventure) { create(:adventure, gamemaster: master) }
    let(:session) { create(:adventure_session, adventure: adventure) }

    let(:activity) { 'adventure::initiate_session' }
    let(:extra) { { session_id: session.id } }

    it 'creates the activity log' do
      log = ActivityLog.log!(
        text: "#{master.name} criou a sessão #{session.title}",
        performer: master,
        adventure: adventure,
        session: session,
        activity: activity,
        extra: extra
      )

      expect(log).to be_persisted
      expect(log.activity).to eq(activity)
      expect(log.extra['session_id']).to eq(extra[:session_id])
      expect(log.text).to eq("#{master.name} criou a sessão #{session.title}")
      expect(log.adventure).to eq(adventure)
      expect(log.session).to eq(session)
    end
  end
end
