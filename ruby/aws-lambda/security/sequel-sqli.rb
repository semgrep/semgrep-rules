require 'jwt'
require 'json'
require 'mysql2'
require 'sequel'

def handler(event:, context:)
  DB = Sequel.connect(
    :adapter  => 'mysql2',
    :host     => ENV["DB_HOST"],
    :port     => ENV["DB_PORT"],
    :database => ENV["DB_NAME"],
    :user     => ENV["DB_USER"],
    :password => ENV["DB_PASSWORD"])

  # ruleid: sequel-sqli
  dataset = DB["SELECT * FROM users WHERE group='#{event['id']}'"]

  # ok: sequel-sqli
  dataset2 = DB['select id from items']

  {statusCode: 200, body: JSON.generate(dataset)}
end