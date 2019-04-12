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
	pool.query(check_login_query, (err, result) => {
		res.render('signup', { title: 'Sign up your account!', result: result.rows });
	});
});

// a new user
router.post('/', function (req, res, next) {
	// Retrieve Information
	var username = req.body.username;
	var password = sha256(req.body.password);
	var number = req.body.number;
	var address = req.body.address;
	var mrt = req.body.mrt;
	var numpets = 0;
	// Construct Specific SQL Query
	var insert_query = sql_query + "(\'" + username + "\',\'" +  password + "\'," + numpets + "," + number + ",\'" + address + "\');";
	var insert_location_query = ("insert into location values ('") + address + "','" + mrt + "');";
	var insert_petowner_query = "insert into petowners values (\'" + username + "\')"

	pool.query(insert_query, (err, not_used1) => {
		pool.query(insert_location_query, (err, not_used2) => {
			pool.query(insert_petowner_query, (err, not_used3) => {
				res.redirect('/login')
			});
		});
	});
});

module.exports = router;
