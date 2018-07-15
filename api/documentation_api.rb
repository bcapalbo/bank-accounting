require 'sinatra'

class DocumentationApi < Sinatra::Application
  set :views, '/app/docs'

  get '/' do

    erb :git_markdown, :locals => { :text => markdown(:api_docs) }
  end
end
