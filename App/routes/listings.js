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

var sql_query = 'INSERT INTO Services VALUES';

/* GET home page. */
var initial_query = "select * from Services S where S.hostName = 'hi';";
router.get('/', function (req, res, next) {
  pool.query(initial_query, (err, data) => {
    res.render('listings', { title: 'My listings', data: data.rows });
  });
});

router.post('/', function (req, res, next) {
  var startDate = req.body.startDate;
  var endDate = req.body.endDate;
  var minBid = req.body.minBid;

  var insert_query = sql_query + "('" + "hi" + "','" + minBid + "','" + startDate + "','" + endDate + "','" + 5 + "')";
  pool.query(insert_query, (err, data) => {
    res.redirect('/listings')
  });
});

module.exports = router;
