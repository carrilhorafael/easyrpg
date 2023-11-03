require 'rails_helper'

RSpec.describe Talent, type: :model do
  it { should belong_to(:creator).class_name('Player') }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:features) }
end
