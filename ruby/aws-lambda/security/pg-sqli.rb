require 'pg'

def show(event:, context:)
  conn = PG::Connection.open(:dbname => 'test')

  # ok: pg-sqli
  res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [event['id'], 2, nil])

  # ruleid: pg-sqli
  res2 = conn.exec_params('SELECT * FROM foobar WHERE id = %{id}' % {id: event['id']})

  {
    body: res2
  }
end