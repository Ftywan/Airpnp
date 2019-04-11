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
    if (result.rows.length) {
      var wishlist_query = "select W.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, S.status, W.ownerName from Services S right join Wishlist W on S.id = W.id where W.ownerName =\'" + result.rows[0]['username'] + "\'";

      pool.query(wishlist_query, (err, data) => {
        res.render('wishlist', { title: 'Wishlist', result: result.rows, data: data.rows });
      });
    }
  });
});

module.exports = router;
