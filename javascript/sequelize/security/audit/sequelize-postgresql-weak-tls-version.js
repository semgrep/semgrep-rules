module.exports = {
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
    // ruleid: sequelize-postgresql-weak-tls-version
      ssl: {
        minVersion: 'TLSv1'
      }
    }
  }
};

module.exports = {
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
    // ruleid: sequelize-postgresql-weak-tls-version
      ssl: {
        minVersion: 'TLSv1.1'
      }
    }
  }
};


module.exports = {
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
    // ok: sequelize-postgresql-weak-tls-version
      ssl: {
        minVersion: 'TLSv1.2'
      }
    }
  }
};
