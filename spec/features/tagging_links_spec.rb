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

  scenario 'anyone can see links filtered by tag' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    tag = Tag.create(content: 'Test Tag')
    LinkTag.create(link_id: link.id, tag_id: tag.id)

    visit('/links')

    within "#link-#{link.id}" do
      click_link "Test Tag"
    end

    expect(current_path).to eq "/tags/#{tag.id}/links"
    expect(page).to have_content 'Test Link'
  end
end