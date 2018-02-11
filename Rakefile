require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the database
  connection.exec("TRUNCATE links;")

  # Add the test data
  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));")
  end
end