require 'rails_helper'

describe Event, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it { is_expected.to validate_presence_of(:user) }

    it { should validate_length_of(:title).is_at_most(100) }
    it { should validate_length_of(:description).is_at_most(100) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:questions) }
  end
end
