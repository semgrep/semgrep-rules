const express = require('express');
const mssql = require('mssql');

(async () => {
  let pool;
  try {
    pool = await new mssql.ConnectionPool({
      user: process.env?.MSSQL_USERNAME ?? '',
      password: process.env?.MSSQL_PASSWORD ?? '',
      server: 'mssql',
      port: 1433,
      database: 'foobar',
      options: {
        trustServerCertificate: true,
        enableArithAbort: true,
      },
    });
  } catch (err) {
    console.log('ERROR: creating new pool SQL error', err.message, err);
    process.exit(1);
  }
  try {
    await pool.connect();
  } catch (err) {
    console.log('ERROR: connecting pool SQL error', err.message, err);
    pool.close();
    process.exit(1);
  }

  const app = express();

  app.get('/', (req, res) => {
    res.send('It Works!');
  });

  app.get('/get-a-user-by-id', async (req, res) => {
    const { id } = req.query;
    console.log('get-a-user-by-id id: ', id);
    let results;
    try {
      const request = pool.request();
      // ruleid: node-mssql-sqli
      const dbResult = await request.query(`SELECT * FROM [foobar].[dbo].[users] WHERE user_id = ${id}`);
      // ok: node-mssql-sqli
      const dbResult = await request.query(`SELECT * FROM [foobar].[dbo].[users] WHERE user_id = ?`);
      results = dbResult?.recordset ?? [];
    } catch (err) {
      console.log('get-user-by-id error', err.message, err);
      res.status(500).json({ errors: [err.message] });
      return;
    }
    res.status(200).json({ results });
  });

  app.listen(8080, () => {
    console.log('Example foobar app listening at http://localhost:8080');
  }).on('error', (err) => {
    console.log('express error: ', err.message, err);
  });
})();

async function test1(userInput) {
  const pool = await new mssql.ConnectionPool({server: 'localhost'});
  const request = pool.request();
  // ruleid: node-mssql-sqli
  const dbResult = await request.query("SELECT * FROM [foobar].[dbo].[users] WHERE user_id =" + userInput);
  return dbResult;
}

async function testOk1() {
  const pool = await new mssql.ConnectionPool({server: 'localhost'});
  const request = pool.request();
  const query = "SELECT * FROM [foobar].[dbo].[users] WHERE user_id = 1";
  // ok: node-mssql-sqli
  const dbResult = await request.query(query);
  return dbResult;
}
