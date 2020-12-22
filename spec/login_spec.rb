require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  describe 'home page' do
    it 'checks the content of the page' do
      visit login_path
      expect(page).to have_content('Log In')
    end
  end
end

RSpec.feature 'Forms field for Email', type: :feature do
  context 'can enter an name' do
    scenario 'should be Signed in successfully.' do
      visit login_path
      within('form') do
        fill_in 'Name', with: 'luffy'
      end
      click_button 'Log in'
      expect(page).to have_content 'Your groups'
    end
  end
end

RSpec.feature 'Forms field for Email', type: :feature do
  context 'can enter an name' do
    scenario 'should not be Signed in successfully.' do
      visit login_path
      within('form') do
        fill_in 'Name', with: 'lu'
      end
      click_button 'Log in'
      expect(page).to_not have_content 'Your groups'
    end
  end
end
