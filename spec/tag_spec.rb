require 'tag'

RSpec.describe Tag do
  describe '.create' do
    it 'creates a new tag' do
      tag = Tag.create(content: 'Test Tag')

      expect(tag.id).not_to be_nil
    end
  end

  describe '.find' do
    it 'finds a tag' do
      tag = Tag.create(content: 'Test Tag')
      found_tag = Tag.find(tag.id)

      expect(found_tag.id).to eq tag.id
      expect(found_tag.content).to eq "Test Tag"
    end
  end

  describe '#links' do
    it 'returns all links that join on the link_tags table with this tag ID' do
      tag = Tag.create(content: 'Test Tag')
      link = Link.create(url: 'http://testexample.com', title: 'Test Link')
      LinkTag.create(link_id: link.id, tag_id: tag.id)

      expect(tag.links.map(&:id)).to include link.id
    end
  end
end