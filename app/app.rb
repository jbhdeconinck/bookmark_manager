require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :views, proc {File.join(root, '..', 'views')}

  get '/links' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links/pre_links' do
    Link.create(title: params[:title], url: params[:url])
    redirect to '/links'
  end

  run! if app_file == $0
end
