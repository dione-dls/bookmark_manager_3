require_relative './database_connection'
require_relative './link'
require_relative './tag'

class LinkTag
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO link_tags (link_id, tag_id) VALUES('#{options[:link_id]}', '#{options[:tag_id]}') RETURNING id")
    LinkTag.new(result[0]['id'])
  end
end