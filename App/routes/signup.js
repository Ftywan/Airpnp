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

var check_login_query = "select username from login";
var sql_query = 'INSERT INTO Users VALUES';

/* GET home page. */
router.get('/', function (req, res, next) {
	pool.query(check_login_query, (err, data) => {
		res.render('signup', { title: 'Sign up your account!', data: data.rows });
	});
});

// a new user
router.post('/', function (req, res, next) {
	// Retrieve Information
	var username = req.body.username;
	var password = sha256(req.body.password);
	var number = req.body.number;
	var address = req.body.address;
	var numpets = req.body.numpets;
	// Construct Specific SQL Query
	var insert_query = sql_query + "('" + username + "'," + 10 + ",'" + password + "'," + numpets + "," + number + ",'" + address + "');";

	pool.query(insert_query, (err, data) => {
		res.redirect('/login')
	});
});

module.exports = router;
