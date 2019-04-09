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


/* GET home page. */
router.get('/', function (req, res, next) {
  pool.query(getQuery(req, res, next), (err, data) => {
    res.render('index', { title: 'Initial Data', data: data.rows })
  });
});


function getQuery(req, res, next) {
  var filter = req.param("filter");
  var query = "select * from Services";


  if (filter == 'price') {
      var low = req.param('low');
      var high = req.param('high');

      query = "select * from Services S where S.minBid> " + low + " and S.minBid< " + high;
  }

  else if (filter == 'time') {
    var start = req.param("start");
    var end = req.param('end');
    
    query = "select * from Services S where S.startdate= " + start + " and S.enddate= " + end;
  }

  else if (filter == 'capacity') {
    var capacity = req.param('capacity');

    query = "select * from Services S where S.capacity=" + capacity;
  }

  else if (filter == 'sort') {
    var value = req.param('value');
    if(value == 'start') {
      query = "select * from Services order by startdate";
    }

    if(value == 'end') {
      query = "select * from Services order by enddate";
    }
  }

  return query;
}


// filter search
router.post('/', function (req, res, next) {
  // Construct Specific SQL Query
  var price_query = "select * from Services order by minBid " + priceOrder;
  var rating_query = "select * from Services S left join Users U on S.hostName=U.username order by U.rating";
  var favourite_query = "select * from Services S where S.hostName in( select hostName from Favourite )";
  var pricefilter_query = "select * from Services S where S.minBid= " + lowPrice + " and S.mindBid= " + highPrice;
  var timefilter_query = "select * from Services S where S.startdate= " + startTime + " and S.enddate= " + endTime;
  var capacity_query = "select * from Services S where S.num=" + capacity;

  query = req.body.query;
});

module.exports = router;
