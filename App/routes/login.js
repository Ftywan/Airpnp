var express = require('express');
var router = express.Router();
var sha256 = require('js-sha256');
var bodyParser = require('body-parser');

// create a new pool
const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'launch',
  port: 5432,
})

router.use(bodyParser.urlencoded({ extended: false }));

var check_login_query = "select username from login";
var clear_login_query = "delete from login";
/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(clear_login_query, (err, unused) => {
    pool.query(check_login_query, (err, result) => {
      res.render('login', { title: 'Airpnp-Login', result: result.rows });
    });
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
  var initial_query = "select username, password from users;"
  var set_login_query = "insert into login (username) values ('" + username + "');"
  pool.query(initial_query, (err, data) => {
    if (data.rows.length) {
      for (var i = 0; i < data.rows.length; i++) {
        if (data.rows[i]["username"] == username) {
          if (data.rows[i]["password"] == password) {
            flag = 1;
            pool.query(set_login_query, (err, data) => {
              res.redirect("/index");
            });
          }
        }
      }
    }
    if (!flag) res.redirect('login');
  });
});

//Log out

// router.post('/index', function (req, res) {
//   // var logout_query = "update users set location = 'logged out' where username = 'test';"
//   // pool.query(logout_query, (err, data));
//   console.log('button was clicked');
//   res.redirect('/');
// });


module.exports = router;