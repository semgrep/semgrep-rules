// Case1: run query by string concatenation using template literals
// ruleid: sequelize-raw-query
db.sequelize.query(
  `INSERT INTO user (username, password) VALUES('${username}','${password}')`
)

// Case 2: Build query by string concatenation using template literals
// ruleid: sequelize-raw-query
var query = `INSERT INTO user (username, password) VALUES('${username}','${password}')`
console.log("check password");
db.sequelize.query(query)


// Case 3: run query by string concatenation using + operator
// ruleid: sequelize-raw-query
db.sequelize.query(
  "INSERT INTO user (username, password) VALUES('" + username + "','" + password + "')"
)

// Case 4: Build query by string concatenation using + operator
// ruleid: sequelize-raw-query
var query = "INSERT INTO user (username, password) VALUES('" + username + "','" + password + "')"
console.log("check password");
db.sequelize.query(query)
