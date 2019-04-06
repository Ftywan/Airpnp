var express = require('express');
var router = express.Router();

// create a new pool
const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'aaaa990730',
  port: 5432,
})

/* GET home page. */
var initial_query = "select * from Services";

router.get('/', function(req, res, next) {
	pool.query(initial_query, (err, data) => {
		res.render('index', { title: 'Initial Data', data: data.rows });
	});
});

module.exports = router;
