var AWS = require('aws-sdk');
const mysql = require('mysql2');

exports.handler = async (event, context) => {
  console.log(event);
  var secretsManager = new AWS.SecretsManager();
  var secretId = event.arguments[0][2];
  const secret = await secretsManager.getSecretValue({
      SecretId: secretId
      }).promise();

  var secretJson = JSON.parse(secret.SecretString);

  var host = secretJson.host;
  var user = secretJson.username;
  var password = secretJson.password;

  let connectionConfig = {
    host: host,
    user: user,
    password: password,
    connectTimeout: 60000
  };

  var pool = await mysql.createPool(connectionConfig);
  var conn = pool.promise();

  var table = event.arguments[0][0];
  var columnName = event.arguments[0][1];

  var createStmt = 'create temporary table ' + table + '_jointemp (temp_seq int, '+ columnName + ' varchar(100)); ';
  // ruleid: mysql-sqli
  await conn.query(createStmt);


  var values = event.arguments.map((x, i) => "("+i+",'"+x[3]+"')");
  var insertStmt = 'insert into ' + table + '_jointemp(temp_seq, '+ columnName +') values ' + values.join(',') + ';';
  // ruleid: mysql-sqli
  await conn.query({sql: insertStmt, rowsAsArray: true});

  var selectStmt = 'select t2.* FROM ' + table + '_jointemp t1 LEFT OUTER JOIN ' + table + ' t2 using ('+ columnName +') order by temp_seq;'
  // ruleid: mysql-sqli
  const [results, fields] = await conn.execute(selectStmt);

  // ok: mysql-sqli
  const [results2, fields2] = await conn.execute('SELECT * FROM foobar WHERE id = ?', [columnName]);

  var res = {};
  if(results.length > 0){
    res = results.map((row) => JSON.stringify(row));
    }
    var response = JSON.stringify({"results": res});
    conn.end();
  return response;
};