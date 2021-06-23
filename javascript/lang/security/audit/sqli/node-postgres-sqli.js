function  bad1() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    // ruleid: node-postgres-sqli
    const res = await client.query(query)
    console.log(res.rows[0].message) // Hello world!
    await client.end()
}


function bad2() {
    const { Client, Pool } = require('pg')
    const pool = new Pool()
    query = "SELECT name FROM users WHERE age="
    query += req.FormValue("age")
    // ruleid: node-postgres-sqli
    const res = await pool.query(query)
    console.log(res.rows[0].message) // Hello world!
    await client.end()
}

function bad3(userinput) {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    query = "SELECT name FROM users WHERE age=".concat(userinput)
    // ruleid: node-postgres-sqli
    const res = await client.query(query)
    console.log(res.rows[0].message) // Hello world!
    await client.end()
}

function bad4() {
    const { Pool } = require('pg')
    const pool = new Pool()
    pool.on('error', (err, client) => {
      console.error('Unexpected error on idle client', err)
      process.exit(-1)
    })
    pool.connect((err, client, done) => {
      if (err) throw err
      // ruleid: node-postgres-sqli
      client.query("SELECT name FROM users WHERE age=" + req.FormValue("age"), (err, res) => {
        done()
        if (err) {
          console.log(err.stack)
        } else {
          console.log(res.rows[0])
        }
      })
    })
}

function bad5(userinput) {
    const { Pool } = require('pg')
    const pool = new Pool()
    // ruleid: node-postgres-sqli
    pool
      .query('SELECT * FROM users WHERE id ='.concat(userinput))
      .then(res => console.log('user:', res.rows[0]))
      .catch(err =>
        setImmediate(() => {
          throw err
        })
      )
}

function ok1() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    query = "SELECT * FROM users WHERE email=".concat("hello")
    // ok: node-postgres-sqli
    client.query(query)
}

function ok2() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    query = "SELECT name FROM users WHERE age=" + "3"
    // ok: node-postgres-sqli
    client.query(query)
}

function ok3() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    query = "SELECT name FROM users WHERE age="
    query += "3"
    // ok: node-postgres-sqli
    client.query(query)
}

function ok4() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    // ok: node-postgres-sqli
    client.query("INSERT INTO users(name, email) VALUES($1, $2)",
  ["Jon Calhoun", userinput])
}

function ok5() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    // ok: node-postgres-sqli
    client.query("SELECT name FROM users WHERE age=" + "3")
}

function ok6() {
    const { Client } = require('pg')
    const client = new Client()
    await client.connect()
    // ok: node-postgres-sqli
    client.query("SELECT * FROM users WHERE email=".concat("hello"))
}

function ok7() {
    const { Client } = require('pg')
    const client = new Client()
    const query = {
      // give the query a unique name
      name: 'fetch-user',
      text: 'SELECT * FROM user WHERE id = $1',
      values: [userinput],
    }
    // ok: node-postgres-sqli
    client.query(query, (err, res) => {
      if (err) {
        console.log(err.stack)
      } else {
        console.log(res.rows[0])
      }
    })
}
