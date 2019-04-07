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

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('login', { title: 'Airpnp-Login' });
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
  pool.query(initial_query, (err, data) => {
    for (var i = 0; i < data.rows.length; i++) {
      if (data.rows[i]["username"] == username) {
        if (data.rows[i]["password"] == password) {
          flag = 1;
          res.redirect('/account');
        }
      }
    }
    if (!flag) res.redirect('login');
  });


})

module.exports = router;