import knex from "knex";
import Knex from "knex";

exports.handler = async (event) => {
  const connection = knex({
    client: "mysql",
    connection: {
      host: process.env.DB_HOST,
      port: Number(process.env.DB_PORT || "3306"),
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
    },
  });

  // ruleid: knex-sqli
  await connection.raw(`
    INSERT INTO  (id, character, cartoon, link)
    VALUES(
        '${event.id}', 
        '${event.character}',
        '${event.cartoon}', 
        '${event.link}'
    )
    `);

  // ok: knex-sqli
  await connection.raw('SELECT * FROM foobar');
};