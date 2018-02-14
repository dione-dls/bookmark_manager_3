feature 'Viewing links' do
  scenario 'A user can see links' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    visit('/links')

    expect(page).to have_content "Test Link"
  end
end
