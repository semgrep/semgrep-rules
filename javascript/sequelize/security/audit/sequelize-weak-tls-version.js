module.exports = {
  local: {
    username: "AppUser",
    database: "AppDb",
    dialect: "postgres",
    host: "127.0.0.1",
    dialectOptions: {
    // ruleid: sequelize-weak-tls-version
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
    // ruleid: sequelize-weak-tls-version
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
    dialect: "mysql",
    host: "127.0.0.1",
    dialectOptions: {
    // ruleid: sequelize-weak-tls-version
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
    dialect: "mariadb",
    host: "127.0.0.1",
    dialectOptions: {
    // ruleid: sequelize-weak-tls-version
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
    // ok: sequelize-weak-tls-version
      ssl: {
        minVersion: 'TLSv1.2'
      }
    }
  }
};
