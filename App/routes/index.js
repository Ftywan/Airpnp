var express = require('express');
var router = express.Router();

var value = "price";

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
var initial_query = "select * from Services";
var test_query = "select * from Services order by minBid asc";

if(value == "price") {
  router.get('/', function(req, res, next) {
    pool.query(test_query, (err, data) => {
      res.render('index', { title: 'Initial Data', data: data.rows });
    });
  });
}

else{
  router.get('/', function(req, res, next) {
	pool.query(initial_query, (err, data) => {
		res.render('index', { title: 'Initial Data', data: data.rows });
	});
});
}


// filter search
router.post('/', function(req, res, next) {
	// Retrieve Information
  var priceOrder = req.body.priceOrder;
  var rating = req.body.rating;
  var favourite = req.body.favourite;
  var lowPrice = req.body.lowPrice;
  var highPrice = req.body.highPrice;
  var startTime = req.body.startTime;
  var endTime = req.body.endTime;
  var capacity = req.body.capacity;
	
	// Construct Specific SQL Query
  var price_query = "select * from Services order by minBid " + priceOrder;
  var rating_query = "select * from Services S left join Users U on S.hostName=U.username order by U.rating";
  var favourite_query = "select * from Services S where S.hostName in( select hostName from Favourite )";
  var pricefilter_query = "select * from Services S where S.minBid= " + lowPrice + " and S.mindBid= " + highPrice;
  var timefilter_query = "select * from Services S where S.startdate= " + startTime + " and S.enddate= " + endTime;
  var capacity_query = "select * from Services S where S.num=" + capacity;
  
  if (priceOrder != "") {
    pool.query(price_query, (err, data) => {
      res.redirect('/index')
    });
  }

  else if (rating != "") {
    pool.query(rating_query, (err, data) => {
      res.redirect('/index')
    });
  }

  else if (favourite != "") {
    pool.query(favourite_query, (err, data) => {
		  res.redirect('/index?rating=true')
    });
  }

  else if (lowPrice != "" && highPrice != "") {
    pool.query(pricefilter_query, (err, data) => {
      res.redirect('/index')
    });
  }

  else if (startTime != "" && endTime != "") {
    pool.query(timefilter_query, (err, data) => {
      res.redirect('/index?rating=true')
    });
  }

  else if (capacity != "") {
    pool.query(capacity_query, (err, data) => {
      res.redirect('/index')
    });
  }

});

module.exports = router;
