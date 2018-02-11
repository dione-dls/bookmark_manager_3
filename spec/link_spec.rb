require 'link'

describe Link do
  describe '.connection' do
    it 'connects to the test database when testing' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      Link.connection
    end

    it 'connects to the development database otherwise' do
      ENV['ENVIRONMENT'] = 'development'

      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager')
      Link.connection
      
      ENV['ENVIRONMENT'] = 'test'
    end
  end

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
  end
end