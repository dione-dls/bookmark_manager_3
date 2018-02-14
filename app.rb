require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './lib/comment'
require './lib/tag'
require './lib/link_tag'
require './lib/user'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/links')
  end

  get '/links' do
    @user = User.find(session[:user_id])
    @links = Link.all
    erb :"links/index"  
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    link = Link.create(url: params['url'], title: params['title'])
    
    flash[:notice] = "You must submit a valid URL." unless link
    redirect('/links')
  end

  post '/links/:id/delete' do
    Link.delete(params['id'])
    redirect '/links'
  end

  get '/links/:id/edit' do
    @link = Link.find(params['id'])
    erb :"links/edit"
  end

  post '/links/:id/update' do
    Link.update(params['id'], params)
    redirect('/')
  end

  get '/links/:id/comments/new' do
    @link = Link.find(params['id'])
    erb :"comments/new"
  end

  post '/links/:id/comments' do
    comment = Comment.create(link_id: params['id'], text: params['text'])
    redirect('/links')
  end

  get '/links/:id/tags/new' do
    @link = Link.find(params['id'])
    erb :"tags/new"
  end

  post '/links/:id/tags' do
    tag = Tag.create(content: params['content'])
    LinkTag.create(link_id: params['id'], tag_id: tag.id)
    redirect('/links')
  end

  get '/tags/:id/links' do
    @links = Tag.find(params['id']).links
    erb :"tags/links/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect('/')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  run! if app_file == $0
end