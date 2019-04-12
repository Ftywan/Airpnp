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

var check_login_query = "select username from login";

/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(checkLogout(req, res, next), (err, logoutData) => {
    pool.query(check_login_query, (err, result) => {
      pool.query(getQuery(req, res, next), (err, data) => {
        res.render('index', { title: 'Initial Data', data: data.rows, result: result.rows })
      });
    });
  });
});

function checkLogout(req, res, next) {
  var query = 'select * from login';
  var action = req.param('action');

  if (action == 'logout') {
    query = 'delete from login';
  }

  return query;

}
function getQuery(req, res, next) {
  var query = "select * from Services where status = \'available\'";
  var filter = req.param("filter");

  if (filter == 'price') {
    var low = req.param('low');
    var high = req.param('high');

    query = "select * from Services S where S.minBid> " + low + " and S.minBid< " + high;
  }

  else if (filter == 'time') {
    var start = req.param("start");
    var end = req.param('end');

    query = "select * from Services S where S.startdate< \'" + start + "\' and S.enddate> \'" + end + "\'";
  }

  else if (filter == 'capacity') {
    var capacity = req.param('capacity');

    query = "select * from Services S where S.capacity=" + capacity;
  }

  else if (filter == 'sort') {
    var value = req.param('value');
    if (value == 'start') {
      query = "select * from Services order by startdate";
    }

    if (value == 'end') {
      query = "select * from Services order by enddate";
    }

    if (value == 'price') {
      query = "select * from Services order by minbid";
    }

    if (value == 'capacity') {
      query = "select * from Services order by capacity";
    }
  }

  return query;
}


// filter search
router.post('/', function (req, res, next) {
  // Construct Specific SQL Query
  var price_query = "select * from Services order by minBid " + priceOrder;
  var favourite_query = "select * from Services S where S.hostName in( select hostName from Favourite )";
  var pricefilter_query = "select * from Services S where S.minBid= " + lowPrice + " and S.mindBid= " + highPrice;
  var timefilter_query = "select * from Services S where S.startdate= " + startTime + " and S.enddate= " + endTime;
  var capacity_query = "select * from Services S where S.num=" + capacity;

  query = req.body.query;
});

module.exports = router;
