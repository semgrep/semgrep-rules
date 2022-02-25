let response;

const prettyPrint = (ob) => JSON.stringify(ob, null, 2).replace('\'','');

const { Client } = require('pg');
exports.handler = async function (event, context) {
  const client = new Client();
  await client.connect();

  // ruleid: tainted-sql-string
  const query = `INSERT INTO messages (body) VALUES ('${prettyPrint(event)}');`;

  try {
    await client.query(query)
    
    // ruleid: tainted-sql-string
    await client.query("INSERT INTO messages (body) VALUES ('" + prettyPrint(event) + "');")

    // ok: tainted-sql-string
    await client.query('INSERT INTO messages (body, message) VALUES ($1, $2);', [prettyPrint(event), records[0]]);

    // ok: tainted-sql-string
    const query2 = 'INSERT INTO messages ' + '(body, message) VALUES ($1, $2);';
    await client.query(query2, [prettyPrint(event), records[0]]);

    // ok: tainted-sql-string
    console.log(`INSERT INTO messages (body) VALUES ('${event['smth']});`);

    await client.end();
  } catch (error) {
    console.log('Could not add row to postgres, soz');
    console.log(error);
  }

  return { key: JSON.stringify(records) };
};