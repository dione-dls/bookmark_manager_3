require 'link'

describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all

      expect(links).to include("http://www.makersacademy.com")
      expect(links).to include("http://www.google.com")
      expect(links).to include("http://www.facebook.com")
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.create(url: 'http://www.testlink.com')

      expect(Link.all).to include 'http://www.testlink.com'
    end

    it 'does not create a new link if the URL is not valid' do
      Link.create(url: 'not a real link')

      expect(Link.all).not_to include 'not a real link'
    end
  end
end