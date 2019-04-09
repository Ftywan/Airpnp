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

var get_favourite_query = "";
var get_pet_query = "";
var add_pet_query = "";
var delete_pet_query = "";
var change_password_query = "";



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('account', { title: 'My account' });
});

module.exports = router;
