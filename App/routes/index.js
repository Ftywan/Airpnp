var express = require('express');
var router = express.Router();


// parsing function
function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}


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
var query = "select * from Services";

router.get('/', function (req, res, next) {
  // get the filter kind
  var filter = getQueryVariable("filter");

  if (filter == 'price') {
    var low = getQueryVariable('low');
    var high = getQueryVariable('high');

    query = "select * from Services S where S.minBid= " + low + " and S.mindBid= " + high;
  }

  // else if (filter == 'time') {
  //   var start = getQueryVariable("start");
  //   var end = getQueryVariable('end');
  // }

  // else if (filter == 'capacity') {
  //   var capacity = getQueryVariable('capacity');
  // }

  // else if (filter == 'sort') {
  //   var value = getQueryVariable('value');
  //   if(value == 'start') {

  //   }

  //   if(value == 'end') {
      
  //   }
  // }




  pool.query(query, (err, data) => {
    res.render('index', { title: 'Initial Data', data: data.rows });
  });
});





// filter search
router.post('/', function (req, res, next) {
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

  pool.query(capacity_query, (err, data) => {
    res.render('index', { title: 'Initial Data', data: data.rows });
  });
});

module.exports = router;
