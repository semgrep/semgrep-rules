module.exports = {
  // ruleid: sequelize-postgresql-enforce-tls
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
};

module.exports = {
  // ok: sequelize-postgresql-enforce-tls
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
      ssl: {
        minVersion: 'TLSv1.3'
      }
   }
};

module.exports = {
  // ok: sequelize-postgresql-enforce-tls
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
      ssl: true
   }
};


module.exports = {
  // ruleid: sequelize-postgresql-enforce-tls
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
      ssl: false
   }
};
