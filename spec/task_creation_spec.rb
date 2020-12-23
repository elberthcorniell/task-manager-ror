require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  describe 'Task creation' do
    it 'It can create valid taks' do
      login
      create_task 'Buy Bitcoin'
      expect(page).to have_content('Buy Bitcoin')
    end

    it 'It can\'t create invalid taks' do
      login
      create_task 'S'
      expect(page).to_not have_content('S')
    end
  end
end
