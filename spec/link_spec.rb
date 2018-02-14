require 'link'

describe Link do
  describe '.all' do
    it 'returns all links, wrapped in a Link instance' do
      links = Link.all

      urls = links.map(&:url)

      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe '.create' do
    it 'creates a new link' do
      link = Link.create(url: 'http://www.testlink.com')

      expect(link.id).not_to be_nil
    end

    it 'does not create a new link if the URL is not valid' do
      link = Link.create(url: 'not a real link')

      expect(link).to be false
    end
  end

  describe '.delete' do
    it 'deletes a link' do
      Link.delete(1)

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include "http://www.makersacademy.com"
    end
  end

  describe '.update' do
    it 'updates a link' do
      Link.update(1, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      links = Link.all
      urls = links.map(&:url)
      titles = links.map(&:title)

      expect(urls).not_to include "http://www.makersacademy.com"
      expect(titles).not_to include "Makers Academy"
      expect(urls).to include "http://www.snakersacademy.com"
      expect(titles).to include "Snakers Academy"
    end
  end

  describe '.find' do
    it 'finds a link' do
      link = Link.find(1)

      expect(link.url).to eq "http://www.makersacademy.com"
      expect(link.title).to eq "Makers Academy"
    end
  end

  describe '#comments' do
    it 'returns all comments with a link_id equal to this link ID' do
      link = Link.create(url: 'http://testexample.com', title: 'My test link')
      comment = Comment.create(link_id: link.id, text: 'My test comment')

      expect(link.comments.map(&:id)).to include comment.id
    end
  end
end