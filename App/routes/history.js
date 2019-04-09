var express = require('express');
var router = express.Router();

// create a new pool
const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'launch',
  port: 5432,
})

var as_owner_query = "select *, username from accommodated A1, login where A1.ownername = username;";
var as_taker_query = "select *, username from accommodated A2, login where A2.hostname = username;"

/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(as_owner_query, (err, owner_data) => {
    pool.query(as_taker_query, (err, taker_data) => {
      res.render('history', { title: 'Transaction history', owner_data: owner_data.rows, taker_data: taker_data.rows });
    });
  });
});

module.exports = router;
