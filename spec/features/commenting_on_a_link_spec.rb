feature 'Commenting on a Link' do
  scenario 'anyone can comment on any link' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    
    visit('/links')

    within "#link-#{link.id}" do
      click_link 'Comment'
    end

    fill_in(:text, with: 'This is a test comment on this link.')
    click_button 'Submit'

    within "#link-#{link.id}" do
      expect(page).to have_content 'This is a test comment on this link.'
    end
  end
end