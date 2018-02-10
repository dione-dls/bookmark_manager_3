# This is a little smoke test to ensure everything's working.
# You should delete this test before working on your app.

feature 'visiting the homepage' do
  scenario 'the basic smoke test passes' do
    visit '/'
    expect(page).to have_content "Hello World"
  end
end
