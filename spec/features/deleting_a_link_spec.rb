feature 'Deleting a link' do
  scenario 'A user can delete a link' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    visit('/links')

    within "#link-#{link.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Makers Academy'
  end
end