# Bookmark Manager

An exemplar of the Bookmark Manager application, with sensible commits.

## Prerequisites

- The PostgreSQL database management system must be installed on your system.

## Getting Started

> If you clone this app from the Initial Commit, you will have a ready-to-go application with RSpec, Sinatra, and Capybara installed. There's a small smoke test, too.

To get started with Bookmark Manager:

```
git clone https://github.com/sjmog/bookmark_manager
cd bookmark_manager
bundle install
rake setup
rspec
```

This will give you the application, and set up two databases: `bookmark_manager` for the development environment, and `bookmark_manager_test` for the test environment.
