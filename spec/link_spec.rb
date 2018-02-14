require 'link'

describe Link do
  before(:each) do
    @link = Link.create(url: 'http://www.testlink.com', title: 'Test Link')
  end
  
  describe 'Database functions' do
    describe '.all' do
      it 'returns all links, wrapped in a Link instance' do
        links = Link.all

        urls = links.map(&:url)

        expect(urls).to include("http://www.testlink.com")
      end
    end

    describe '.create' do
      it 'creates a new link' do
        expect(@link.id).not_to be_nil
      end

      it 'does not create a new link if the URL is not valid' do
        link = Link.create(url: 'not a real link')

        expect(link).to be false
      end
    end

    describe '.delete' do
      it 'deletes a link' do
        Link.delete(@link.id)

        links = Link.all
        urls = links.map(&:url)

        expect(urls).not_to include "http://www.testlink.com"
      end
    end

    describe '.update' do
      it 'updates a link' do
        Link.update(@link.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

        links = Link.all
        urls = links.map(&:url)
        titles = links.map(&:title)

        expect(urls).not_to include "http://www.testlink.com"
        expect(titles).not_to include "Test Link"
        expect(urls).to include "http://www.snakersacademy.com"
        expect(titles).to include "Snakers Academy"
      end
    end

    describe '.find' do
      it 'finds a link' do
        link = Link.find(@link.id)

        expect(link.url).to eq "http://www.testlink.com"
        expect(link.title).to eq "Test Link"
      end
    end
  end

  describe '#comments' do
    it 'returns all comments with a link_id equal to this link ID' do
      comment = Comment.create(link_id: @link.id, text: 'My test comment')

      expect(@link.comments.map(&:id)).to include comment.id
    end
  end

  describe '#tags' do
    it 'returns all tags that join on the link_tags table with this link ID' do
      tag = Tag.create(content: 'Test Tag')
      LinkTag.create(link_id: @link.id, tag_id: tag.id)

      expect(@link.tags.map(&:id)).to include tag.id
    end
  end
end