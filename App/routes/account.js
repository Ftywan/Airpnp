var express = require('express');
var router = express.Router();
var sha256 = require('js-sha256');

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
var get_favorite_query = "select l.username, f.hostname from login l, favorite f where f.ownername = l.username;";
var get_pet_query = "select l.username, p.petname, p.pettype from login l, pets p where p.ownername = l.username;";
var get_password_query = "select password from users where username = '";
var username = '';
var password = '';
var become_petowner_query = "insert into petowners values ('";
// Auto become petowner upon adding pet


function getQuery(req, res, next) {
  var query = "select * from pets";
  var process = req.param("process");

  if (process == 'add') {
    var petName = req.param('petName');
    var type = req.param('type');

    query = "begin transaction; insert into pets values ('" + petName + "', '" + type + "', '" + username + "'); update users set numpets = numpets + 1 where username = '" + username + "'; commit;";
  }

  if (process == 'delete') {
    var petName = req.param('petName');
    query = "begin transaction; delete from pets p where p.petname = '" + petName + "' and p.ownername = '" + username + "'; update users set numpets = numpets - 1 where username = '" + username + "'; commit;";
  }

  if (process == 'change') {
    var oldP = sha256(req.param('oldP'));
    var newP = sha256(req.param('newP'));
    if (oldP == password) {
      query = "update users set password = '" + newP + "' where username = '" + username + "';";
    }
    else query = "select * from users;";
  }

  return query;
}

/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => {
    if (result.rows.length) {
      username = result.rows[0]["username"];
    } // for adding to petowners
    var become_petowner_query_2 = become_petowner_query + username + "');";
    var get_password_query_2 = get_password_query + username + "';";
    pool.query(get_password_query_2, (err, pass) => {
      if (result.rows.length) {
        password = pass.rows[0]["password"];
      }
      pool.query(become_petowner_query_2, (err, added_account) => {
        pool.query(getQuery(req, res, next), (err, addded) => { //for processes
          pool.query(get_favorite_query, (err, get_favorite) => {
            pool.query(get_pet_query, (err, get_pet) => {
              res.render('account', { title: 'My account', result: result.rows, get_favorite: get_favorite.rows, get_pet: get_pet.rows });
            });
          });
        });
      });
    });
  });
});



module.exports = router;