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
      Link.create(url: 'http://www.testlink.com')

      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include 'http://www.testlink.com'
    end

    it 'does not create a new link if the URL is not valid' do
      Link.create(url: 'not a real link')

      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include 'not a real link'
    end
  end
end