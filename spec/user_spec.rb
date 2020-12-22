require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'Should have a name' do
      expect(User.new).to_not be_valid
    end
    
    it 'Should have a valid user' do
      expect(User.new(name: 'zorro')).to be_valid
    end
    
    it 'Can\'t be repeted' do
      User.create!(name: 'zorro')
      expect(User.new(name: 'zorro')).to_not be_valid
    end
  end
end
