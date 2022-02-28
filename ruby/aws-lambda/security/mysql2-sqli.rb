require 'json'
require 'mysql2'

def mysql_client
  @mysql_client ||= Mysql2::Client.new(
    host: ENV['RDS_ARN'],
    username: 'rootuser',
    password: 'rootuser00',
    database: 'access_db',
    port: 3306
  )
end

def handler(event:, context:)
  # ok: mysql2-sqli
  mysql_client.query("CREATE TABLE access_table (id varchar(32) NOT NULL, timestamp varchar(32));")

  # ruleid: mysql2-sqli
  results = mysql_client.query("SELECT * FROM users WHERE group='#{event['id']}'")

  escaped = client.escape(event['id'])
  # ok: mysql2-sqli
  results2 = mysql_client.query("SELECT * FROM users WHERE group='#{escaped}'")

  {statusCode: 200, body: JSON.generate(results)}
end