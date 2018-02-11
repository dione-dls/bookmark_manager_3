require 'pg'

class Link
  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.create(options)
    connection.exec("INSERT INTO links (url) VALUES('#{options[:url]}')")
  end
end