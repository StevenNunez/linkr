require 'rails_helper'

feature "Creating Shortlinks", :type => :feature do
  describe "As a logged in user" do
    scenario "Creating a short link" do
      User.create(username: "StevenNunez", password: "secret")
      visit '/'
      click_link 'Log in'

      fill_in 'username', with: 'StevenNunez'
      fill_in 'password', with: 'secret'
      click_button 'Log in'

      click_link 'Create New Shortlink'

      fill_in 'short_link_original_link', with: 'http://reddit.com'
      click_button 'Create Shortlink'

      expect(page.body).to include('New Shortlink has been created')
    end
  end

  describe "As an unauthenticated user" do
    scenario "Unable to create a shortlink" do
      visit '/'
      click_link 'Create a new Shortlink'
      expect(page.current_path).to eq('/sessions/new')
      expect(page.body).to include('You must be logged in to create a Shortlink')
    end
  end
end
