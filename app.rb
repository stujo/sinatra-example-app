require 'sinatra/base'

class EmailDupesApp < Sinatra::Base
  get "/" do
    erb :index
  end
end