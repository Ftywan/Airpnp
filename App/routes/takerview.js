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

var login_query = "select username from login";
// var get_a_id_query = "select max(id) from accommodation;";
var username = '';
// var a_id = 0;

function getQuery(req, res, next) {
    var query = "select * from users"; //no use
    var process = req.param("process");
    if (process == 'assign') {
        var id = req.param('id');
        var ownername = req.param('ownername');
        // a_id = a_id + 1;
        query = "update BiddingStatus set status='success' where ownerName='" + ownername + "' and id = " + id + " and status='pending'; update BiddingStatus set status='fail' where id=" + id + "and ownername <> '" + ownername + "' and status='pending'; insert into Accommodation values (" + id + ",'" + username + "', '" + ownername + "', 'sending', 10);";
        res.redirect('/history');
    }
    return query;

}

/* GET home page. */
router.get('/', function (req, res, next) {
    // pool.query(get_a_id_query, (err, id_of_a) => {
    //     if (id_of_a.rows.length) {
    //         a_id = id_of_a.rows[0]["max"];
    //         console.log(a_id);
    //     }
    pool.query(login_query, (err, result) => {
        var id = req.param("id");
        if (result.rows.length) {
            username = result.rows[0]["username"];
        }
        var listing_query = "select * from biddingstatus where id = " + id + " and status = 'pending';";
        pool.query(listing_query, (err, data) => {
            pool.query(getQuery(req, res, next), (err, no_use) => {
                res.render('takerview', { title: 'All about pets', result: result.rows, data: data.rows });
            });
        });
    });
});

module.exports = router;
