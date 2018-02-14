feature 'tagging links' do
  scenario 'anyone can tag a link' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    visit('/links')

    within "#link-#{link.id}" do
      click_link "Add tag"
    end

    fill_in(:content, with: 'Test Tag')
    click_button('Submit')

    within "#link-#{link.id}" do
      expect(page).to have_content 'Test Tag'
    end
  end
end