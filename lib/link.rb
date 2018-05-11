require_relative 'database_connection'
require 'uri'

class Link
  attr_reader :id, :url, :title, :comments

  def initialize(id, url, title, comments)
    @id = id
    @url = url
    @title = title
    @comments = comments
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links INNER JOIN comments ON links.id=comments.bookmark_id")

    result.map { |link| Link.new(link['id'], link['url'], link['title'], comments['text']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{options[:url]}', '#{options[:title]}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  def self.update(id, options)
    DatabaseConnection.query("UPDATE links SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id = #{id}")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }.first
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
