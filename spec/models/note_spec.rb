require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { create(:note) } #Using FactoryGirl

  it 'has a valid factory' do
    expect(note).to be_valid
  end

  it 'has a body' do
    note.body = nil
    expect(note).not_to be_valid
  end

  it 'has a user' do
    expect(note.user).to be_valid
  end
end
