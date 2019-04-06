var express = require('express');
var router = express.Router();
var sha256 = require('js-sha256');

const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'launch',
  port: 5432,
})

var sql_query = 'INSERT INTO Users VALUES';

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('signup', { title: 'Sign up your account!' });
});

// a new user
router.post('/', function(req, res, next) {
	// Retrieve Information
	var username = req.body.username;
	var password = sha256(req.body.password);
	var number = req.body.number;
	var address = req.body.address;
	var question = req.body.question;
	var answer = req.body.answer;
	
	// Construct Specific SQL Query
	var insert_query = sql_query + "('" + username + "','" + 10 + "','" + password + "','" + 0 + "','" + address + "','" + number + "','" + question + "','" + answer + "')";
	
	pool.query(insert_query, (err, data) => {
		res.redirect('/index')
	});
});

module.exports = router;
