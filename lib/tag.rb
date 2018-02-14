require_relative './database_connection'

class Tag
  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{options[:content]}') RETURNING id, content")
    Tag.new(result[0]['id'], result[0]['content'])
  end
end