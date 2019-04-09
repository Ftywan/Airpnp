var express = require('express');
var router = express.Router();
var sha256 = require('js-sha256');

// create a new pool
const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'aaaa990730',
  port: 5432,
})

var check_login_query = "select username from users where location = 'logged in again';";
/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(check_login_query, (err, result) => {
    console.log(result);
    res.render('login', { title: 'Airpnp-Login', result: result.rows });
  });
});
// router.get('/:user', function (req, res, next) {
//   var user = req.params.user;
//   //res.render('login', { user })
//   res.send(user);
// });


/* POST login */
router.post('/', function (req, res, next) {
  const username = req.body.username;
  const password = sha256(req.body.password);
  var flag = 0;
  var initial_query = "select username, password, location from users;"
  var set_login_query = "update users set location = 'logged in again' where username = '" + username + "';";
  console.log(set_login_query);
  pool.query(initial_query, (err, data) => {
    for (var i = 0; i < data.rows.length; i++) {
      if (data.rows[i]["username"] == username) {
        if (data.rows[i]["password"] == password) {
          flag = 1;
          pool.query(set_login_query, (err, data) => {
            res.redirect("/account");
          });
          console.log(data.rows[i]["location"]);
        }
      }
    }
    if (!flag) res.redirect('login');
  });
});

//Log out
router.post('/logout', function (req, res) {
  var logout_query = "update users set location = 'logged out' where username = 'test';"
  pool.query(logout_query, (err, data));
  console.log("Logged out");
});

module.exports = router;