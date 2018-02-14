require 'link_tag'

RSpec.describe LinkTag do
  describe '.create' do
    it 'creates a new join between links and tags' do
      link = Link.create(url: 'http://testexample.com', title: 'Test Link')
      tag = Tag.create(content: 'Test Tag')
      link_tag = LinkTag.create(link_id: link.id, tag_id: tag.id)

      expect(link_tag.id).not_to be_nil
    end
  end
end