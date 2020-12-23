require 'rails_helper'

RSpec.describe 'Tasks', type: :feature do
  describe 'Can done task' do
    it 'It can done tasks' do
      login
      create_task 'Buy Bitcoin'
      click_link 'Done'
      visit tasks_path
      Capybara.using_wait_time(10) do
        visit tasks_done_path
      end
      expect(page).to have_content('Undone')
    end
  end
end

RSpec.describe 'Tasks', type: :feature do
  describe 'Can done task' do
    it 'It can\'t Done already done taks' do
      login
      create_task 'Buy Bitcoin'
      click_link 'Done'
      Capybara.using_wait_time(10) do
        visit tasks_path
      end
      expect(page).to_not have_content('Buy Bitcoin')
    end
  end
end

RSpec.describe 'Tasks', type: :feature do
  describe 'Can undone task' do
    it 'It undone taks' do
      login
      create_task 'Buy Bitcoin'
      click_link 'Done'
      Capybara.using_wait_time(10) do
        visit tasks_path
      end
      Capybara.using_wait_time(10) do
        visit tasks_done_path
      end
      click_link 'Undone'
      expect(page).to_not have_content('Buy Bitcoin')
    end
  end
end
