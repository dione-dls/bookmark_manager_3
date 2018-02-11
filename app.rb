require 'sinatra/base'
require './lib/link'
require 'pg'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add-a-new-link' do
    erb :add_a_new_link
  end

  post '/create-new-link' do
    Link.create(url: params['url'])
    redirect '/'
  end

  run! if app_file == $0
end