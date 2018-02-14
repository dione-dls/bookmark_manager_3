feature 'Commenting on a Link' do
  scenario 'anyone can comment on any link' do
    visit('/links')

    within '#link-1' do
      click_link 'Comment'
    end

    fill_in(:text, with: 'This is a test comment on this link.')
    click_button 'Submit'

    within '#link-1' do
      expect(page).to have_content 'This is a test comment on this link.'
    end
  end
end