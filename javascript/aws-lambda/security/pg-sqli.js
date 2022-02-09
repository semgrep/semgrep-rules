let response;

const prettyPrint = (ob) => JSON.stringify(ob, null, 2).replace('\'','');
const timestamp = () => new Date();

const toBase64 = (msg) => Buffer.from(msg).toString('base64');

const { Client } = require('pg');
exports.handler = async function (event, context) {
  console.log("the event");
  console.log(event);

  const client = new Client({
    user: "test",
    host: "db",
    database: "nockslots",
    password: "test",
    port: 5432,
  });

  console.log("connecting to db...");

  await client.connect();

  records = [];
  event.Records.forEach((record) => {
    const { body } = record;
    console.log(body);
    records.push(toBase64(body));
  });

  const query = `INSERT INTO public.messages (body, encoded_message) VALUES ('${prettyPrint(event)}', '${records[0]}');`;

  console.log('the query:');
  console.log(query);

  try {
    console.log("Trying the query...");
    // ruleid: pg-sqli
    await client.query(query)
    // ok: pg-sqli
    await client.query('INSERT INTO messages (body, message) VALUES ($1, $2);', [prettyPrint(event), records[0]])
    await client.end();
  } catch (error) {
    console.log('Could not add row to postgres, soz');
    console.log(error);
  }

  return { key: JSON.stringify(records) };
};