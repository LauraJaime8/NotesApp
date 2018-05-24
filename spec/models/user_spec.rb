require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) } #Using FactoryGirl
  let(:invalid_user) { build(:user) } #Using FactoryGirl

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'has a unique email' do
    invalid_user.email = user.email
    expect(invalid_user).not_to be_valid
  end

  it 'has a username' do
    invalid_user.name = nil
    expect(invalid_user).not_to be_valid
  end

  it 'has a password' do
    invalid_user.password = nil
    expect(invalid_user).not_to be_valid
  end

  context 'with notes' do
    let(:user) { create(:user_with_notes) }

    it 'has a valid factory' do
      expect(user.notes.count).to eq(2)
    end
  end
end
