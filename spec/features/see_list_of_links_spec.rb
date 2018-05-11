feature 'Viewing links' do
  scenario 'A user can see links' do
    visit('/links'):

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Facebook"
  end

  scenario 'User can see comments on links' do
    visit('/links')
    expect(page).to have_content "This is my favourite link"
  end

end
