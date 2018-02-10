# Run this script before running tests to add the test data to the test database.
require 'pg'

p "Cleaning database..."

connection = PG.connect(dbname: 'bookmark_manager_test')

# Clear the database
connection.exec("TRUNCATE links;")

# Add the test data
connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")