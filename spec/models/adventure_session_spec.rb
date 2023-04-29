require 'rails_helper'

RSpec.describe AdventureSession, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:adventure) }
  end

  describe 'validations' do
    it { is_expected.to belong_to(:adventure) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'attributes' do
    it { is_expected.to have_attribute(:date) }
    it { is_expected.to have_attribute(:title) }
    it { is_expected.to have_attribute(:description) }
    it { is_expected.to have_attribute(:finished_at) }
  end

  describe '#finished?' do
    context 'when finished_at is present' do
      subject { described_class.new(finished_at: Time.current) }

      it 'returns true' do
        expect(subject.finished?).to be true
      end
    end

    context 'when finished_at is not present' do
      subject { described_class.new(finished_at: nil) }

      it 'returns false' do
        expect(subject.finished?).to be false
      end
    end
  end

  describe '#time_played' do
    context 'when finished' do
      subject { described_class.new(created_at: 1.hour.ago, finished_at: Time.current) }

      it 'returns the time between created_at and finished_at' do
        expect(subject.time_played).to be_within(1.second).of(1.hour)
      end
    end

    context 'when not finished' do
      subject { described_class.new(created_at: 3.hours.ago, finished_at: nil) }

      it 'returns the time between created_at and now' do
        expect(subject.time_played).to be_within(1.second).of(3.hours)
      end
    end
  end
end
