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


var as_owner_query = "select l.username, s.startdate, s.id, s.enddate, a.hostname, b.bids, a.status from login l, Accommodation a join Services s on s.id = a.id left join BiddingStatus b on s.id = b.id where a.ownername = l.username and b.status = 'success';";
var as_taker_query = "select l.username, s.startdate, s.id, s.enddate, a2.ownername, b.bids, a2.status from login l, accommodation a2 join services s on s.id = a2.id join BiddingStatus b on b.id = a2.id where a2.hostname = l.username and b.status = 'success';"
var check_login_query = "select username from login";

function getQuery(req, res, next) {
  var query = "select * from services;";
  var process = req.param("action");

  if (process == "finish") {
    var id = req.param("id");
    query = "update accommodation set status = \'completed\' where id = " + id + ";";
    console.log(query);
  }
  return query;
}

/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(getQuery(req, res, next), (err, no_use) => {
    pool.query(check_login_query, (err, result) => {
      pool.query(as_owner_query, (err, owner_data) => {
        pool.query(as_taker_query, (err, taker_data) => {
          res.render('history', { title: 'Transaction history', result: result.rows, owner_data: owner_data.rows, taker_data: taker_data.rows });
        });
      });
    });
  });
});

module.exports = router;
