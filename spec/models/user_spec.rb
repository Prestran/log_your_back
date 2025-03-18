require 'rails_helper'

RSpec.describe User do
  describe '#name' do
    it 'returns the name of the user' do
      user = build(:user)
      expect(user.name).to eq 'Email'
    end
  end
end
