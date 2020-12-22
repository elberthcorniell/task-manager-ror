require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'task' do
    it 'Should have a name' do
      expect(Task.new).to_not be_valid
    end
    
    it 'To not be valid without author' do
      expect(Task.new(name: 'Buy Bitcoin')).to_not be_valid
    end

    it 'Should have an author' do
      author = User.create!(name: 'author')
      expect(Task.new(name: 'Buy Bitcoin', author_id: author.id, description: '12345')).to be_valid
    end

    
    it 'Name can\'t be bigger than 16 chars' do
      expect(Task.create(name: 'z' * 17)).to_not be_valid
    end
  end
end
