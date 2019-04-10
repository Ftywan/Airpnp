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

var initial_query = "select *, username from BiddingStatus b, login where b.ownerName = username and b.status = 'pending';";
/* GET home page. */
router.get('/', function (req, res, next) {
    pool.query(initial_query, (err, data) => {
        res.render('biddings', { title: 'Your biddings', data: data.rows });
    });
});

module.exports = router;
