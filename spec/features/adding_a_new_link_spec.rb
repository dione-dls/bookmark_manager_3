feature 'Adding a new link' do
  scenario 'A user can add a link to Bookmark Manager' do
    visit('/add-a-new-link')
    fill_in('url', with: 'http://testlink.com')
    click_button('Submit')

    expect(page).to have_content 'http://testlink.com'
  end
end