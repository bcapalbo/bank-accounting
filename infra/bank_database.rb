require 'uri'
require 'mysql2'

class BankDatabase
  attr_accessor :client

  def initialize(connection_uri: ENV['BANK_DB_URI'])
    @uri = URI.parse(connection_uri)
    create_client
  end

  def client
    create_client if @client.nil? || @client.closed?
    @client
  end

  private
  def create_client
    @client = Mysql2::Client.new(
      host: @uri.host,
      username: URI.unescape(@uri.user),
      password: URI.unescape(@uri.password),
      port: @uri.port,
      database: @uri.path.split('/')[1],
      encoding:  'utf8',
      reconnect: true
    )
  end
end
