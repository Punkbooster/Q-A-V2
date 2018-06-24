require 'rails_helper'

describe Question, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:contents) }
    it { is_expected.to validate_presence_of(:event) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:user) }
  end
end
