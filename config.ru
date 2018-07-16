require 'sinatra'
require './api/documentation_api'
require './api/account_api'
require 'rack'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser
use Rack::NestedParams

if development?
  require_relative './db/migrate/bank_migration'

  BankMigration.migrate
end

run Rack::URLMap.new(
  "/v1/" => DocumentationApi.new,
  "/v1/account/" => AccountApi.new,
)
