require 'rails_helper'

describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:company_name) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:time_zone) }
  end

  context 'associations' do
    it { is_expected.to have_many(:events) }
  end
end
