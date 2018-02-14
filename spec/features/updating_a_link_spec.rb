feature 'Updating a link' do
  scenario 'A user can update a link' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')

    visit("/links/#{link.id}/edit")

    fill_in('url', with: 'http://www.snakersacademy.com')
    fill_in('title', with: "Snakers Academy")
    click_button 'Submit'

    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Test Link'
    expect(page).to have_content 'Snakers Academy'
  end
end