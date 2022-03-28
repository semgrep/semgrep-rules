require 'pg'

def show(event:, context:)
  conn = PG::Connection.open(:dbname => 'test')

  # ok: tainted-sql-string
  res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [event['id'], 2, nil])

  # ok: tainted-sql-string
  res3 = conn.exec_params('SELECT * FROM foobar WHERE id = %{id}' % {id: "something"})
  
  # ok: tainted-sql-string
  query = 'SELECT * FROM foobar WHERE id = ' + "something"
  res4 = conn.exec_params(query)

  # ruleid: tainted-sql-string
  res2 = conn.exec_params('SELECT * FROM foobar WHERE id = %{id}' % {id: event['id']})

  # ruleid: tainted-sql-string
  res5 = conn.exec_params("SELECT * FROM foobar WHERE id = #{event['id']}")

  # ok: tainted-sql-string
  puts("SELECT * FROM foobar WHERE id = #{event['id']}")

  {
    body: res2
  }
end