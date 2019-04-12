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
var initial_query = "select s.minbid, b.id, l.username, s.hostName, s.startdate, s.enddate, b.bids, b.status from login l, BiddingStatus b left join Services s on b.id = s.id where b.status = 'pending' and b.ownername = username;";

/* GET home page. */
router.get('/', function (req, res, next) {
    pool.query(check_login_query, (err, result) => {
        pool.query(initial_query, (err, data) => {
            res.render('biddings', { title: 'Your biddings', data: data.rows, result: result.rows });
        });
    });
});


router.post('/', function (req, res, next) {
    var id = req.body.id;
    var bid = req.body.bidding;
    var user = req.body.user;

    var query = "update BiddingStatus set bids = "+ bid +" where id = "+ id + " and ownerName = \'" + user + "\'";

    pool.query(query, (err, data) =>{
        res.redirect('biddings')
    });
});
module.exports = router;
