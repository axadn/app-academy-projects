require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'the signup process' do
  before(:each) do
    visit(new_user_url)
  end
  scenario 'has a new user page' do
    expect(page).to have_content("New User")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in 'username', with: 'aura'
      fill_in 'password', with: 'croft123'
      click_on 'Sign Up'
      expect(page).to have_content('aura')
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after logging in' do
    User.create(username: "hippo", password: "world123")
    visit(new_session_url)
    fill_in 'username', with: "hippo"
    fill_in "password", with: "world123"
    click_on 'Log in'
    expect(page).to have_content('hippo')
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit(new_session_url)
    expect(page).not_to have_selector(:link_or_button, 'Log out')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    User.create(username: "hippo", password: "world123")
    visit(new_session_url)
    fill_in 'username', with: "hippo"
    fill_in "password", with: "world123"
    click_on 'Log in'
    expect(page).to have_content('hippo')
    click_on 'Log out'
    expect(page).not_to have_content('hippo')
  end
end
