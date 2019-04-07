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
/* GET home page. */
var initial_query = "select * from Services";
router.get('/', function (req, res, next) {
  pool.query(initial_query, (err, data) => {
    res.render('listings', { title: 'My listings', data: data.rows });
  });
});

module.exports = router;
