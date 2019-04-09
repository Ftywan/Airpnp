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

var check_login_query = "select username from login";
var become_caretaker_query = "INSERT INTO caretakers VALUES ('";  
// Auto become a caretaker upon creating a listing
var create_listing_query = 'INSERT INTO Services VALUES';
var initial_query = "select *, username from Services S, login where S.hostName = username;";
var username = '';

/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => { // for the use of creating listings
    pool.query(initial_query, (err, data) => {
      if (result.rows.length) {
        username = result.rows[0]["username"];
      }
      res.render('listings', { title: 'My listings', data: data.rows });
    });
  });
});
// router.get('/:user', function (req, res, next) {
//   var user = req.params.user;
//   //res.render('login', { user })
//   res.send(user);
// });

router.post('/', function (req, res, next) {
  var startDate = req.body.startDate;
  var endDate = req.body.endDate;
  var minBid = req.body.minBid;
  var capacity = req.body.capacity;

  var insert_query = become_caretaker_query + username + "');" + create_listing_query + "('" + username + "'," + minBid + ",'" + startDate + "','" + endDate + "'," + capacity + ")";
  pool.query(insert_query, (err, data) => {
    console.log(insert_query);
    res.redirect('/listings')
  });
});

module.exports = router;
