let response;

const prettyPrint = (ob) => JSON.stringify(ob, null, 2).replace('\'','');
const timestamp = () => new Date();

const toBase64 = (msg) => Buffer.from(msg).toString('base64');

const { Sequelize } = require('sequelize');
exports.handler = async function (event, context) {
  console.log(event);
  const sequelize = new Sequelize('postgres://user:pass@example.com:5432/dbname')

  records = [];
  event.Records.forEach((record) => {
    const { body } = record;
    records.push(toBase64(body));
  });

  const query = `INSERT INTO public.messages (body, encoded_message) VALUES ('${JSON.stringify(event)}', '${records[0]}');`;
  console.log(query);

  try {
    // ruleid: sequelize-sqli
    await sequelize.query(query)

    // ok: sequelize-sqli
    await sequelize.query(
      'SELECT * FROM projects WHERE status = :status',
      {
        replacements: { status: 'active' },
        type: QueryTypes.SELECT
      }
    );
  } catch (error) {
    console.log(error);
  }

  return { key: JSON.stringify(records) };
};