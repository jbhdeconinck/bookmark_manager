require './app/models/link'

feature "Viewing links" do

  background do
    Link.create(url: 'https://www.makersacademy.com', title: 'Makers Academy')
  end

  scenario 'I can see a list of links on the homepage' do
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
