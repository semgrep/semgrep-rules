import knex from "knex";
import Knex from "knex";

exports.handler = async (req,res,next) => {
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

  // ruleid: node-knex-sqli
  await connection.raw(`
    INSERT INTO  (id, character, cartoon, link)
    VALUES(
        '${req.query.id}', 
        '${req.body.character}',
        '${req.query.cartoon}', 
        '${req.foo.link}'
    )
    `);

  // ok: node-knex-sqli
  await connection.raw('SELECT * FROM foobar');
};