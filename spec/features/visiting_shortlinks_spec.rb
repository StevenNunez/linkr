require 'rails_helper'

feature "Visiting shortlinks", :type => :feature do
  scenario "valid shortlinks" do
    short_link = ShortLink.create(original_link: "http://reddit.com")
    visit "/#{short_link.short_code}"
    expect(page.body).to include('reddit.com')
    expect(page.body).to include(short_link.short_code)
  end

  scenario "invalid shortlinks" do
    visit '/not_a_real_thing'
    expect(page.current_path).to eq('/')
    expect(page.body).to include('not_a_real_thing is not a valid Shortcode')
  end
end
