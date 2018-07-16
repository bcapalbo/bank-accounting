require 'json'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?

class BaseApi < Sinatra::Application
  set :show_exceptions, false

  after do
    headers \
    "Content-Type" => "application/json"
    response.body = response.body ? response.body.to_json : nil
  end
end
