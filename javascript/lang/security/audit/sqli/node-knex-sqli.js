import knex from "knex";

async function test1(input) {
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
        '${input.id}', 
        '${input.character}',
        '${input.cartoon}', 
        '${input.link}'
    )
    `);

  // ok: node-knex-sqli
  await connection.raw('SELECT * FROM foobar');
};