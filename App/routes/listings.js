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
var create_listing_query = 'INSERT INTO Services VALUES';
var get_max_id_query = 'select max(id) from services;';
var initial_query = " select s.id, s.minbid, s.startdate, s.enddate, s.capacity, l.username, b.bonus from services s left join specialbonus B on b.id = s.id, login l where S.hostName = l.username and S.status = 'available';";
var username = '';
var new_id = 0;


/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => { // for the use of creating listings
    pool.query(get_max_id_query, (err, max_id) => { // for the use of creating listings
      pool.query(initial_query, (err, data) => {
        if (result.rows.length) {
          username = result.rows[0]["username"];
        }
        if (max_id.rows.length) {
          new_id = max_id.rows[0]["max"] + 1;
        }
        res.render('listings', { title: 'My listings', data: data.rows, result: result.rows });
      });
    });
  });
});
// router.get('/:user', function (req, res, next) {
//   var user = req.params.user;
//   //res.render('login', { user })
//   res.send(user);
// });


//  Create new listing
router.post('/', function (req, res, next) {
  var startDate = req.body.startDate;
  var endDate = req.body.endDate;
  var minBid = req.body.minBid;
  var capacity = req.body.capacity;
  var bonus = req.body.bonus;

  // var insert_query = create_listing_query + " (" + new_id + ",'" + username + "'," + minBid + ",'" + startDate + "','" + endDate + "'," + capacity + ");";
  var become_caretaker_query = "INSERT INTO caretakers VALUES ('" + username + "');";
  var new_query = "Begin transaction; insert into Services values (" + new_id + ", \'" + username+ "\', "+ minBid +", \'"+ startDate +"\', \'"+ endDate +"\', " + capacity + ", 'available'); insert into SpecialBonus values ((select id from Services where hostName = \'"+ username +"\' and startdate = \'"+ startDate+"\' and enddate = \'"+ endDate +"\'), \'"+bonus+"\'); commit";

  pool.query(become_caretaker_query, (err, not_used1) => { // Auto become a caretaker
    console.log(become_caretaker_query);
    pool.query(new_query, (err, not_used2) => {
      res.redirect('/listings');
    });
  });
});

module.exports = router;
