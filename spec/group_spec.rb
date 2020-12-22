require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validation' do
    it 'Should have a name' do
      expect(Group.new).to_not be_valid
    end

    it 'Should have a valid name and author' do
      author = User.create!(name: 'author')
      expect(Group.new(name: 'zorro', user_id: author.id)).to be_valid
    end

    it 'Should have a valid name' do
      expect(Group.new(name: 'zo')).to_not be_valid
    end

    it 'Can\'t be repeted' do
      author = User.create!(name: 'author')
      Group.create!(name: 'zorro', user_id: author.id)
      expect(Group.new(name: 'zorro')).to_not be_valid
    end
  end
end
