require './app/models/link'

# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature "creating links" do
  scenario "add a link to the database" do
    visit '/links'
    click_button('add new link')
    expect(current_path).to eq '/links/new'

    fill_in('title', with: 'Google')
    fill_in('url', with: 'www.google.com')
    click_button 'Create link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to have_content('www.google.com')
    end
  end
end
