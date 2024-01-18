const {config} = require('dotenv');

config();

module.exports = {
  "development": {
    "username": process.env.DB_USER || "341185",
    "password": process.env.DB_PASSWORD == "null" ? null : "ThereIsAPassword",
    "database": process.env.DB_DATABASE || "luluaylen00_argenleague",
    "host": process.env.DB_HOST || "mysql-luluaylen00.alwaysdata.net",
    "dialect": "mysql",
    "port": process.env.DB_PORT || 3306
  },
  "test": {
    "username": process.env.DB_USER || "341185",
    "password": process.env.DB_PASSWORD || "ThereIsAPassword",
    "database": process.env.DB_DATABASE || "luluaylen00_argenleague",
    "host": process.env.DB_HOST || "mysql-luluaylen00.alwaysdata.net",
    "dialect": "mysql",
    "port": process.env.DB_PORT || 3306
  },
  "production": {
    "username": process.env.DB_USER || "341185",
    "password": process.env.DB_PASSWORD || "ThereIsAPassword",
    "database": process.env.DB_DATABASE || "luluaylen00_argenleague",
    "host": process.env.DB_HOST || "mysql-luluaylen00.alwaysdata.net",
    "dialect": "mysql",
    "port": process.env.DB_PORT || 3306
  }
}
