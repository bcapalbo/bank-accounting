require 'json'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?

class BaseApi < Sinatra::Application
  after do
    headers \
    "Content-Type" => "application/json"
    response.body = response.body.to_json if response.body
  end
end
