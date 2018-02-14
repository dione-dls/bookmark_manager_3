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

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE id = #{id}")
    result.map { |tag| Tag.new(tag['id'], tag['content']) }.first
  end

  def links
    result = DatabaseConnection.query("SELECT links.id, url, title FROM link_tags INNER JOIN links ON links.id = link_tags.link_id WHERE link_tags.tag_id = #{@id};")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end
end