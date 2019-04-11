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

var as_owner_query = "select l.username, s.startdate, s.enddate, a.ownerName, a.status from login l, Accommodation a join Services s on s.id = a.id where a.id = l.username;";
var as_taker_query = "select *, username from accommodation A2, login where A2.hostname = username;"
var check_login_query = "select username from login";


/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => {
    pool.query(as_owner_query, (err, owner_data) => {
      pool.query(as_taker_query, (err, taker_data) => {
        res.render('history', { title: 'Transaction history', result: result.rows, owner_data: owner_data.rows, taker_data: taker_data.rows });
      });
    });
  });
});

module.exports = router;
