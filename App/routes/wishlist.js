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
/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => {
    var wishlist_query = "select * from wishlist where ownername = '" + result.rows[0]["username"] + "';";
    pool.query(wishlist_query, (err, wishlist_result) => {
      var final_query = "select * from services S where S.id = " + wishlist_result.rows[0]["id"];
      pool.query(final_query, (err, data) => {
        res.render('wishlist', { title: 'Wishlist', result: result.rows, wishlist_result: wishlist_result.rows, data: data.rows});
      });
    });
  });
});

module.exports = router;
