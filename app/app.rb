require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  get '/links' do
    @links = Link.all
    erb :index
  end

  run! if app_file == $0
end
